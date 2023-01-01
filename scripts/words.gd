extends Node

enum CATEGORIES {
	calendar,
	colors,
	ious,
	ment,
	ly,
	ty,
	ness,
	ship,
	ate,
	ise,
	ify,
	en,
	gh,
	time,
	spatial,
	ere,
	de,
	re,
	over,
	ful,
	ive,
	al
}

var calendar = [
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday",
	"Sunday",
	"January",
	"February",
	"March",
	"April",
	"may",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December",
	"Spring",
	"Summer",
	"autumn",
	"Winter",
	"Easter",
	"Christmas"
]

var colors = [
	"white",
	"black",
	"red",
	"orange",
	"yellow",
	"green",
	"blue",
	"purple",
	"pink"
]

var ious = [
	"vicious",
	"gracious",
	"spacious",
	"malicious",
	"precious",
	"conscious",
	"delicious",
	"suspicious",
	"atrocious",
	"ferocious",
	"ambitious",
	"cautious",
	"fictitious",
	"infectious",
	"nutritious",
	"contentious",
	"superstitious",
	"pretentious",
	"anxious",
	"obnoxious"
]

var ment = [
	"equipment",
	"environment",
	"government",
	"parliament",
	"enjoyment",
	"document",
	"management",
	"movement",
	"replacement",
	"statement"
]

var ly = [
	"certainly",
	"definitely",
	"possibly",
	"probably",
	"frequently",
	"often",
	"occasionally",
	"rarely"
]

var ty = [
	"community",
	"curiosity",
	"ability",
	"visibility",
	"captivity",
	"activity",
	"eternity",
	"flexibility",
	"possibility",
	"sensitivity"
]

var ness = [
	"happiness",
	"hardness",
	"madness",
	"nastiness",
	"silliness",
	"tidiness",
	"childishness",
	"willingness",
	"carelessness",
	"foolishness"
]

var ship = [
	"membership",
	"ownership",
	"partnership",
	"dictatorship",
	"championship",
	"craftsmanship",
	"fellowship",
	"apprenticeship",
	"citizenship",
	"sponsorship"
]

var ate = [
	"pollinate",
	"captivate",
	"activate",
	"motivate",
	"communicate",
	"medicate",
	"elasticate",
	"hyphenate",
	"alienate",
	"validate"
]

var ise = [
	"criticise",
	"advertise",
	"capitalise",
	"finalise",
	"equalise",
	"fertilise",
	"terrorise",
	"socialise",
	"visualise",
	"vandalise"
]

var ify = [
	"amplify",
	"solidify",
	"signify",
	"falsify",
	"glorify",
	"notify",
	"testify",
	"purify",
	"intensify",
	"classify"
]

var en = [
	"blacken",
	"brighten",
	"flatten",
	"lengthen",
	"mistaken",
	"straighten",
	"shorten",
	"thicken",
	"tighten",
	"toughen"
]

var gh = [
	"though",
	"although",
	"dough",
	"doughnut",
	"through",
	"cough",
	"trough",
	"rough",
	"tough",
	"enough",
	"plough",
	"bough",
	"drought",
	"brought",
	"bought",
	"wrought",
	"thought",
	"ought",
	"borough",
	"thorough"
]

var time = [
	"yesterday",
	"tomorrow",
	"later",
	"immediately",
	"earlier",
	"eventually",
	"recently",
	"previously",
	"finally",
	"lately"
]

var spatial = [
	"nearby",
	"everywhere",
	"nowhere",
	"inside",
	"downstairs",
	"outside",
	"upstairs",
	"underneath",
	"behind",
	"somewhere"
]

var ere = [
	"sincere",
	"interfere",
	"sphere",
	"adhere",
	"severe",
	"persevere",
	"atmosphere",
	"mere",
	"hemisphere",
	"austere"
]

var de = [
	"deflate",
	"deform",
	"decode",
	"decompose",
	"defuse",
	"definite",
	"desperate"
]

var re = [
	"recycle",
	"rebuild",
	"rewrite",
	"replace",
	"revisit"
]

var over = [
	"overthrow",
	"overturn",
	"overslept",
	"overcook",
	"overreact",
	"overestimate",
	"overuse",
	"overpaid",
	"overlook",
	"overbalance"
]

var ful = [
	"boastful",
	"faithful",
	"doubtful",
	"fearful",
	"thankful",
	"beautiful",
	"pitiful",
	"plentiful",
	"fanciful",
	"merciful"
]

var ive =[
	"attractive",
	"creative",
	"addictive",
	"assertive",
	"abusive",
	"cooperative",
	"exhaustive",
	"appreciative",
	"offensive",
	"expressive"
]

var al = [
	"musical",
	"political",
	"accidental",
	"mathematical",
	"functional",
	"tropical",
	"professional",
	"central",
	"global",
	"industrial"
]

var trick = [
	"past",
	"passed",
	"proceed",
	"precede",
	"aisle",
	"isle",
	"aloud",
	"allowed",
	"affect",
	"effect",
	"farther",
	"father",
	"guessed",
	"guest",
	"heard",
	"herd",
	"led",
	"lead",
	"mourning",
	"morning",
	"stationary",
	"stationery",
	"steal",
	"steel",
	"wary",
	"weary",
	"who’s",
	"whose",
	"fate",
	"fete",
	"alter",
	"altar",
	"ascent",
	"assent",
	"bridal",
	"bridle",
	"cereal",
	"serial",
	"compliment",
	"complement",
	"principal",
	"principle",
	"profit",
	"prophet",
	"descent",
	"dissent",
	"desert",
	"dessert",
	"draft",
	"draught"
]

func get_words_by_category(categories: Array[CATEGORIES]) -> Array[String]:
	var ret: Array[String] = []
	var category: Array[String]
	for cat in categories:
		match cat:
			CATEGORIES.calendar:
				category = calendar
			CATEGORIES.colors:
				category = colors
			CATEGORIES.ious:
				category = ious
			CATEGORIES.ment:
				category = ment
			CATEGORIES.ly:
				category = ly
			CATEGORIES.ty:
				category = ty
			CATEGORIES.ness:
				category = ness
			CATEGORIES.ship:
				category = ship
			CATEGORIES.ate:
				category = ate
			CATEGORIES.ise:
				category = ise
			CATEGORIES.ify:
				category = ify
			CATEGORIES.en:
				category = en
			CATEGORIES.gh:
				category = gh
			CATEGORIES.time:
				category = time
			CATEGORIES.spatial:
				category = spatial
			CATEGORIES.ere:
				category = ere
			CATEGORIES.de:
				category = de
			CATEGORIES.re:
				category = re
			CATEGORIES.over:
				category = over
			CATEGORIES.ful:
				category = ful
			CATEGORIES.ive:
				category = ive
			CATEGORIES.al:
				category = al
		ret += category
	return ret
