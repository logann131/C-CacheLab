//Nam (Logan) Nguyen
//CSC 322 2021

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//Please give me a star xD xD

//Line set up
typedef struct {
	int valid;		//valid bit
	long lineTag;		//tag
	int LFUtracker; 	//track least frequently used way
	int LRUtracker; 	//track least recently used way
} Line;

void LRUOrganizer(Line * setLine, int i, int E){
	int oldLRU = setLine[i].LRUtracker;
	setLine[i].LRUtracker = E-1;
	int j = 0;
	while (j < E){
		if ((j != i) && (setLine[j].LRUtracker > oldLRU)){
			setLine[j].LRUtracker--;
		}
		j++;
	}
}

int main (){

	int S, E, B, m, h, p;		//set, lines, blockSize, and m bit address, hit time, miss penalty  respectively
	char repPol[3];			//replacement policy either LRU or LFU
	
	//take input from stdin to set up the cache simulator
	printf("Welcome to the Cache Simulation!\n");
	scanf("%d %d %d %d %s %d %d", &S, &E, &B, &m, repPol, &h, &p);

	
	//setIndex bits  s
	int s = (int) log2(S);
	//offset bits b
	int b = (int) log2(B);
	//tag bits t
	int t = m - s - b;
	
	//the cache size C = S x E x B
	int C = S * E * B;

	//misses and hits
	int hits = 0; 
	int misses= 0;
	//cycle
	int cycles = 0;

	//cache simulators -- cache setup
	Line** set = malloc (sizeof(Line) * S);	//2d array 
	for  (int i = 0; i<S; i++){
		set[i] =  malloc (sizeof(Line) * E);
		for (int j = 0; j < E; j++){
			/*initialize setLine */
			set[i][j].valid = 0;
			set[i][j].lineTag = 0;
			set[i][j].LRUtracker = j;
			set[i][j].LFUtracker = 0;


		}
	}
	
	//user input
	long userInput = 0;
	
	//if userInput != -1, keep looping
	while (userInput != -1){
		
		scanf("%lx", &userInput);
			
		if (userInput == -1){	
			break;	
		}
		//get setIndex 
		long setIndex = (userInput >> b) & ((1 << s) - 1) ; 		// right shift b to get rid of offset bits. Mask (1<<s - 1) creates s number of 1s. 
											// apply this mask to get most significant bits turned off -> 0
		//get tag
		long tag = (userInput >> (s+b)) & ((1 << t) - 1);			// right shift b+s to get rid of offset and setIndex bits. Same ideas mask 1<<5 -1 creates t numbers of 1s.
											// apply mask to make sure both logical and artihmetic would lead to the same results.
		

		//work with this particular set[setIndex]
		Line* setLine = set[setIndex];
		/*direct-mapped cache*/
		if (E == 1){
			/*Miss cases */
			if ( setLine -> valid == 0|| (setLine -> valid == 1 && setLine -> lineTag != tag))	{  	
				printf("%lx M\n", userInput);	
				setLine -> valid = 1;
				setLine -> lineTag = tag;
				misses++;
				cycles += p + h;		//each miss adds miss penalty and hit time to the cycle
			}	
			/*hit cases*/
			else{
				printf("%lx H \n", userInput);
				setLine -> lineTag = tag;
				hits++;	
				cycles += h;			//each hit adds hit time to the cycle;
			
			}
		}  /* E-way set associative and fully associative */ 
		else if ((E > 1 && E < C/B) || E == C/B){
			/* LRU policy */
				int setCapacity = 0;		//keep tracking the set capacity

				for (int i = 0; i < E; i++){			
					 /* miss cases */
				 	 if (setLine[i].valid == 0){
						printf("%lx M\n", userInput);
						setLine[i].valid = 1;
						setLine[i].lineTag = tag;
						/*since LRU and LFU are two completely different cases, they dont touch each other*/
						setLine[i].LFUtracker = 0;		//set LFU to 0 everytime a reference is made on this line
						LRUOrganizer(setLine, i, E);		//Organize LRU trackers -- update MRU and LRU everytime a reference is made
				 		misses++;
						cycles += p + h;
						break;
					}else if (setLine[i].lineTag != tag){
						setCapacity++;
						 				
					} /* hit cases */ 
					 else {
						printf("%lx H\n", userInput);
						setLine[i].LFUtracker++;		//increment LFU after every hit so that its tracker would be more frequenced
						LRUOrganizer(setLine, i, E);		//Organize LRU trackers -- update MRU and LRU everytime a reference is made
						hits++;
						cycles += h;
						break;
					}/* miss cases when eviction is neccessary */	
					 if (setCapacity == E) { //no invalid lines
							misses++;
							cycles += p+h;
							printf("%lx M\n", userInput);		//lineTag != tag --> miss
							/*LRU policy*/
							if (strcmp(repPol, "LRU") == 0){
								int index = 0;
								/*find the LRU cache line*/
								for (int j = 0; j < E; j++){
									if (setLine[j].LRUtracker == 0){	//LRU line is the line that has its tracker = 0
										index = j;
									}
								}
								LRUOrganizer(setLine, index, E);	//organizes LRU cache lines --> turns LRU into MRU and updates others
								setLine[index].lineTag = tag;		//evicts
		
							}/*lFU policy*/ 
							else if (strcmp(repPol, "LFU") == 0){
								int leastFreg = setLine[0].LFUtracker;
								int index = 0;
								for (int k = 0; k < E; k++){
									if (setLine[k].LFUtracker < leastFreg){	//find minimum LFU tracker <==> LFU line 
										leastFreg = setLine[k].LFUtracker;
										index = k;	
									}
								}
								setLine[index].lineTag = tag;
								setLine[index].LFUtracker = 0;							}
						 }					
				}

		}
		


	}
	/* result line */
	double  missRate = (double) (misses * 100) / (hits + misses);
	printf("%.f %d \n",  missRate, cycles);

	/* free memory */
	for (int i = 0; i < S; i++){
		free(set[i]); // free all setLine got mallocd
	}
	free(set);	//free top level set

	
	return 0;

}



			

