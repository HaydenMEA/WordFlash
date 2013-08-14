//
//  WFWordController.m
//  WordFlash
//
//  Created by Tony Newth on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFWordController.h"
#import "WFword.h"
#import "WFdifficulty.h"


@interface WFWordController ()
@property (nonatomic, strong) WFdifficulty *level;

@end
@implementation WFWordController


+(WFWordController *)defaultManager	//--create a singleton
{
	static __strong WFWordController *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[WFWordController alloc] init];
	});
	
	return sharedInstance;
}


- (id) init
{
	self = [super init];
	if(self)
	{
		
	}
	
	return self;
}

- (void)loadWordsWithSpeedModifier:(CGFloat)speedModifer
{
	NSArray *strings = @[@"Apple",
					  @"Banana",
					  @"Happy",
					  @"Weather",
					  @"Table",
					  @"Computer", @"Screen",
					  @"Building",
					  @"Sun",
					  @"Coffee",
					  @"Audion",
					  @"Anatidaephobia",
					  @"Agateophobia",
					  @"anisette",
					  @"underdraw",
					  @"chaotically",
					  @"perineurium",
					  @"comanchean",
					  @"theban",
					  @"hotbox",
					  @"labefaction",
					  @"glandlike",
					  @"predictability",
					  @"niihau",
					  @"invectiveness",
					  @"stripe",
					  @"lycaon",
					  @"evenus",
					  @"ignobility",
					  @"bargain",
					  @"ran",
					  @"hopvine",
					  @"carbonization",
					  @"unsilicified",
					  @"etruscology",
					  @"venizelos",
					  @"sweated",
					  @"glenlike",
					  @"fissured",
					  @"heterosphere",
					  @"emmeleen",
					  @"beck",
					  @"kayes",
					  @"unjovial",
					  @"fulfil",
					  @"jargon",
					  @"preaggravate",
					  @"etiquette",
					  @"cultivating",
					  @"feathercut",
					  @"rewrite",
					  @"dispersal",
					  @"hypermnestra",
					  @"nonvigilance",
					  @"irreverent",
					  @"hebraize",
					  @"pocket",
					  @"isoagglutinative",
					  @"unvolcanic",
					  @"seferiades",
					  @"softwood",
					  @"toyer",
					  @"impunitive",
					  @"minkfish",
					  @"escarp",
					  @"violette",
					  @"torreon",
					  @"shagginess",
					  @"tagging",
					  @"survivable",
					  @"hyperoxide",
					  @"sunglasses",
					  @"mylohyoidean",
					  @"praenomen",
					  @"stoicheiometric",
					  @"superoxygenated",
					  @"enjoyably",
					  @"curiousness",
					  @"hightail",
					  @"ouananiche",
					  @"sinologue",
					  @"perilaus",
					  @"giftedly",
					  @"unslagged",
					  @"unbewitched",
					  @"thermometry",
					  @"posterity",
					  @"knowingly",
					  @"ectotrophic",
					  @"nonfraudulency",
					  @"sanger",
					  @"atonicity",
					  @"specular",
					  @"welshwoman",
					  @"keyhole",
					  @"unrealistically",
					  @"syntypic",
					  @"cylindroid",
					  @"antiquing",
					  @"overneutralization",
					  @"propontis",
					  @"preagitating",
					  @"resplendently",
					  @"laraine",
					  @"retack",
					  @"proagrarian",
					  @"anisopteran",
					  @"horrific",
					  @"grecized",
					  @"nondeclamatory",
					  @"pollux",
					  @"faddish",
					  @"nonassonance",
					  @"eiffel",
					  @"disguisedness",
					  @"psellism",
					  @"forestallment",
					  @"irmina",
					  @"periodic",
					  @"fox",
					  @"longfellow",
					  @"backsplicing",
					  @"liard",
					  @"eudiometric",
					  @"spongier",
					  @"reinvolved",
					  @"missyllabifying",
					  @"invaluableness",
					  @"hypersystolic",
					  @"imamate",
					  @"overpayment",
					  @"diphenyl",
					  @"premonarchal",
					  @"immunize",
					  @"minho",
					  @"tenurial",
					  @"circularity",
					  @"bobby",
					  @"operationism",
					  @"percussion",
					  @"preborrowing",
					  @"ironical",
					  @"stimulate",
					  @"glenwood",
					  @"epithelioma",
					  @"clairseacher",
					  @"nontrading",
					  @"occultation",
					  @"gaekwar",
					  @"snatcher",
					  @"chemiluminescence",
					  @"marginis",
					  @"epistler",
					  @"beach",
					  @"houselander",
					  @"massiness",
					  @"sniggerer",
					  @"former",
					  @"route",
					  @"daniell",
					  @"unmarginal",
					  @"bewitchment",
					  @"quarrelsomely",
					  @"inter",
					  @"schuyler",
					  @"nonburdensome",
					  @"erratum",
					  @"unbuttered",
					  @"daylights",
					  @"sprinkling",
					  @"proband",
					  @"armrest",
					  @"casual",
					  @"gravelike",
					  @"voicefulness",
					  @"facer",
					  @"fledgiest",
					  @"featherbrain",
					  @"diversionary",
					  @"daily",
					  @"lunately",
					  @"thetically",
					  @"synesthesia",
					  @"manetho",
					  @"lupercalias",
					  @"opener",
					  @"calgary",
					  @"tenerife",
					  @"acetylize",
					  @"abhorrent",
					  @"acroter",
					  @"moolvie",
					  @"telodynamic",
					  @"boutonniere",
					  @"fell",
					  @"libertas",
					  @"phonol",
					  @"gynaeceum",
					  @"drysalter",
					  @"plicature",
					  @"nelson",
					  @"toning",
					  @"mesogleal",
					  @"attenuating",
					  @"orono",
					  @"immoderacy",
					  @"braccae",
					  @"uninfluenced",
					  @"silver",
					  @"mayest",
					  @"scoria",
					  @"probasketball",
					  @"weepiest",
					  @"conclusionally",
					  @"canned",
					  @"kumquat",
					  @"turkishly",
					  @"suasive",
					  @"alecithal",
					  @"pretransmission",
					  @"capitasti",
					  @"columbine",
					  @"binghi",
					  @"thief",
					  @"moil",
					  @"artilleryman",
					  @"gaberdine",
					  @"epaxial",
					  @"iatrochemistry",
					  @"monometallic",
					  @"wield",
					  @"apheresis",
					  @"iritis",
					  @"unshedding",
					  @"rubefaction",
					  @"unhewable",
					  @"swingingly",
					  @"unparcelled",
					  @"hagiography",
					  @"forefend",
					  @"ortonville",
					  @"fester",
					  @"butylene",
					  @"moesogoth",
					  @"botvinnik",
					  @"alkoran",
					  @"proximal",
					  @"counterpoison",
					  @"pleuropneumonic",
					  @"stymied",
					  @"spiriferous",
					  @"deuteragonist",
					  @"lockbox",
					  @"tarlton",
					  @"unsensual",
					  @"obsess",
					  @"outblowing",
					  @"kasavubu",
					  @"interapplication",
					  @"combater",
					  @"quentin",
					  @"flew",
					  @"townless",
					  @"ungymnastic",
					  @"henneries",
					  @"technicality",
					  @"cite",
					  @"hunterlike",
					  @"meghalaya",
					  @"bedmate",
					  @"mislabeled",
					  @"pylon",
					  @"disassociation",
					  @"belier",
					  @"notturno",
					  @"candlemas",
					  @"homeoplasia",
					  @"jamb",
					  @"actinopterygian",
					  @"unrefrigerated",
					  @"divagate",
					  @"nonmanufacture",
					  @"forty",
					  @"sorbian",
					  @"nab",
					  @"periptery",
					  @"electrocuting",
					  @"ashkenazic",
					  @"nonexhibitionism",
					  @"slavery",
					  @"nonportrayable",
					  @"climactical",
					  @"medicably",
					  @"retropack",
					  @"deathly",
					  @"djibbah",
					  @"utricle",
					  @"baptized",
					  @"crusade",
					  @"nonindictable",
					  @"phrenetically",
					  @"transvaluing",
					  @"downlike",
					  @"disguiser",
					  @"simplism",
					  @"perlitic",
					  @"avdp",
					  @"oenopides",
					  @"sing",
					  @"hypermetaphorical",
					  @"zygophyllaceous",
					  @"nonextrication",
					  @"invigorant",
					  @"yttric",
					  @"hypogastrium",
					  @"tackless",
					  @"polemics",
					  @"west",
					  @"debateable",
					  @"unplacated",
					  @"delegate",
					  @"semiacid",
					  @"subdirectorship",
					  @"pulpiest",
					  @"gujerat",
					  @"trancedly",
					  @"multicore",
					  @"hiawatha",
					  @"nex",
					  @"cliquishly",
					  @"unstethoscoped",
					  @"wondrously",
					  @"iglau",
					  @"erastian",
					  @"barton",
					  @"aerophilately",
					  @"shrimplike",
					  @"morrison",
					  @"unskillful",
					  @"palladous",
					  @"overreflective",
					  @"kerchieft",
					  @"ripplet",
					  @"lechatelierite",
					  @"reluctivimining",
					  @"conjugative",
					  @"flog",
					  @"dichrooscope",
					  @"balmily",
					  @"emeline",
					  @"transcribing",
					  @"botany",
					  @"trappiness",
					  @"nonextensibility",
					  @"distressfully",
					  @"jubilate",
					  @"valkyrie",
					  @"watercourse",
					  @"respectful",
					  @"amis",
					  @"protozoological",
					  @"underfloor",
					  @"wordsworthianism",
					  @"skipdent",
					  @"lilibell",
					  @"mundugumor",
					  @"reevacuation",
					  @"phonotypically",
					  @"johnsonianly",
					  @"munich",
					  @"forbiddingness",
					  @"vigrid",
					  @"exchequer",
					  @"galeated",
					  @"kloof",
					  @"soever",
					  @"supercritical",
					  @"platysma",
					  @"achieved",
					  @"gel",
					  @"intoxicant",
					  @"autolytic",
					  @"commentator",
					  @"princeliness",
					  @"uneradicated",
					  @"sardegna",
					  @"refractorily",
					  @"unpillared",
					  @"incardinated",
					  @"echolalic",
					  @"frapping",
					  @"patulously",
					  @"inn",
					  @"ilesha",
					  @"outface",
					  @"informally",
					  @"benevolently",
					  @"nonliterariness",
					  @"indefensibility",
					  @"dedicated",
					  @"transthoracic",
					  @"nonconcessive",
					  @"cathodically",
					  @"resource",
					  @"packaging",
					  @"lemont",
					  @"belorussian",
					  @"spirillar",
					  @"holeproof",
					  @"orem",
					  @"dextrorse",
					  ];;
	
	NSMutableArray *wordsM = [[NSMutableArray alloc] init];
	
	[strings enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		WFword *word = [[WFword alloc] init];
		word.string = obj;
		int minSpeed = 3;
		int maxSpeed = 6;
		int variableSpeed = 50;
		if
			((variableSpeed / [obj length]) < minSpeed)	//--give each word different speeds based on length
			word.speed = minSpeed;
		else if
			(variableSpeed / [obj length] > maxSpeed)
			word.speed = maxSpeed;
		else
			(word.speed = variableSpeed / [obj length]);
		word.speed *= speedModifer;
		[wordsM addObject:word];
	}];
	_words = wordsM;

}

-(void)createWords:(NSInteger)numberOfWords
{
	NSMutableArray *selectedWords = [[NSMutableArray alloc] init];	//Create a set to hold a selection of words
	NSMutableArray *wordSelection = [[NSMutableArray alloc] initWithArray:_words];
	for(int x=0; x< numberOfWords /* get from difficulty */; x++)
	{
		int indexNumberToUse = arc4random() %wordSelection.count; //--select words to use from the dictionary
		
		[selectedWords addObject:wordSelection[indexNumberToUse]];
		[wordSelection removeObject:wordSelection[indexNumberToUse]];//- populate the set with the words from the array
	}
	
	_selectedWords = selectedWords;
}
-(void)createDistractWords:(NSInteger)numberOfWords
{
	NSMutableArray *selectedWords = [[NSMutableArray alloc] init];	//Create a set to hold a selection of words
	NSMutableArray *wordSelection = [[NSMutableArray alloc] initWithArray:_words];
	for(int x=0; x< numberOfWords /* get from difficulty */; x++)
	{
		int indexNumberToUse = arc4random() %wordSelection.count; //--select words to use from the dictionary
		
		[selectedWords addObject:wordSelection[indexNumberToUse]];
		[wordSelection removeObject:wordSelection[indexNumberToUse]];//- populate the set with the words from the array
	}
	
	_selectedWords = selectedWords;
}



- (BOOL)containsWord:(WFword *)word		//--checks if the word existed in selected words
{
	BOOL contains = [_selectedWords containsObject:word];
	
	return contains;
}


@end
