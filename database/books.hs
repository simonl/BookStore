import Data.Map as Map
import Data.List as List

type Grams = Int
type Centimeter = Double
type Dollars = Double
type Genre = String

data Book = Book { 
	title :: String,
	author :: String,
	publisher :: String,
	isbn10 :: String, 
	isbn13 :: String,
	description :: String,
	pages :: Int,
	price :: Dollars,
	weight :: Grams,
	dimensions :: (Centimeter, Centimeter, Centimeter)
} deriving (Show, Eq)

thumbnail book = "thumbnails/" ++ isbn13 book ++ ".jpg"
cover book = "covers/" ++ isbn13 book ++ ".jpg"
listPrice book = price book
salePrice book | isbn13 book !! 6 == '5' = 0.9 * listPrice book 
	       | otherwise = listPrice book
wholesalePrice book = price book


catalog :: [(Genre, [Book])]
catalog = [
	("Self-Help", selfHelp), 
	("History", history), 
	("Law", law), 
	("Literature/Fiction", literatureFiction),
	("Romance", romance),
	("Fantasy/Science-Fiction", fantasyScienceFiction)]

selfHelp :: [Book]
selfHelp = [
	Book {
		title = "Irritable Bowel Syndrome and Diverticulosis: A Self-Help Plan",
		author = "Shirley Trickett",
		publisher = "Conari Press",
		isbn10 = "0722538618",
		isbn13 = "978-0722538616",
		description = "Irritable Bowel Syndrome is an extremely common disorder which is diagnosed in 50% of cases of people who have consulted a gastroenterologist.",
		pages = 192,
		price = 48.3,
		weight = 204,
		dimensions = (21.3, 13.2, 1.8)
	},
	Book {
		title = "Healing Your Emotional Self: A Powerful Program to Help You Raise Your Self-Esteem, Quiet Your Inner Critic, and Overcome Your Shame",
		author = "Beverly Engel",
		publisher = "Wiley",
		isbn10 = "0470127783",
		isbn13 = "978-0470127780",
		description = "In Healing Your Emotional Self, Beverly Engel, one of the world's leading experts on emotional, physical, and sexual abuse, explains how to heal the damage to your self-image and self-esteem caused by negative parental messages and offers treatment to help you lead a happier and healthier life. This breakthrough guide is designed to help you reject the distorted images your parents either intentionally or unintentionally projected onto you. Step by step, this innovative method will give you the skills you need to quiet your inner critic, boost your self-esteem, create a positive self-image separate from your abusive parents' distorted picture, discover who you really are, learn self-nurturing, and become the person you are meant to be.",
		pages = 272,
		price = 17.99,
		weight = 386,
		dimensions = (22.6, 14.8, 2)
	},
	Book {
		title = "The Book of Awesome",
		author = "Neil Pasricha",
		publisher = "Penguin",
		isbn10 = "0425238903",
		isbn13 = "978-0425238905",
		description = "Based on the award-winning blog 1000awesomethings.com, The Book of Awesome is a high five for humanity and a big celebration of life's little moments and the underappreciated, simple things that make us happy, from popping bubble wrap to hitting a bunch of green lights in a row, to waking up thinking it's Monday and realizing it's Saturday. With wise, witty observations from writer Neil Pasricha, this treasure trove is filled with smile-inducing musings that make readers feel like kids looking at the world for the first time: AWESOME!",
		pages = 400,
		price = 17.50,
		weight = 340,
		dimensions = (20.3, 12.7, 3)
	},
	Book {
		title = "How to Win Friends and Influence People",
		author = "Dale Carnegie",
		publisher = "Gallery Books",
		isbn10 = "0671027034",
		isbn13 = "978-0671027032",
		description = "For more than sixty years the rock-solid, time-tested advice in this book has carried thousands of now famous people up the ladder of success in their business and personal lives. Now this previously revised and updated bestseller is available in trade paperback for the first time to help you achieve your maximum potential throughout the next century!",
		pages = 288,
		price = 17.50,
		weight = 249,
		dimensions = (21, 13.5, 2)
	},
	Book {
		title = "7 Habits of Highly Effective People",
		author = "Stephen R. Covey",
		publisher = "Simon & Schuster Canada",
		isbn10 = "0743269519",
		isbn13 = "978-0743269513",
		description = "In The 7 Habits of Highly Effective People, author Stephen R. Covey presents a holistic, integrated, principle-centered approach for solving personal and professional problems. With penetrating insights and pointed anecdotes, Covey reveals a step-by-step pathway for living with fairness, integrity, service, and human dignity -- principles that give us the security to adapt to change and the wisdom and power to take advantage of the opportunities that change creates.",
		pages = 384,
		price = 18.95,
		weight = 340,
		dimensions = (21.1, 13.7, 2.5)
	},
	Book {
		title = "The Power of Now: A Guide to Spiritual Enlightenment",
		author = "Eckhart Tolle",
		publisher = "New World Library",
		isbn10 = "1577314808",
		isbn13 = "978-1577314806",
		description = "The Power of Now is a guide to spiritual awakening from a man who is emerging as one of this generation's clearest, most inspiring teachers on the subject. Eckhart Tolle is not aligned with any particular religion but does what all the great masters have done: shows that the way, the truth, and the light already exist within each human being. There is no need to look elsewhere. At the heart of the book is Tolle's own story of early despair that culminated in a life-transforming experience of enlightenment at the age of 29. He emerged to share insights on the perils of the mind, the power of the present, and the accessibility of one's true nature. According to Tolle, \"To regain awareness of Being and to abide in that state of 'feeling-realization' is enlightenment.\" --This text refers to the Audio Cassette edition.",
		pages = 224,
		price = 14.95,
		weight = 181,
		dimensions = (21.6, 13.9, 1.6)
	},
	Book {
		title = "The 4-Hour Workweek, Expanded and Updated: Expanded and Updated, With Over 100 New Pages of Cutting-Edge Content",
		author = "Timothy Ferriss",
		publisher = "Crown Archetype",
		isbn10 = "0307465357",
		isbn13 = "978-0307465351",
		description = "Forget the old concept of retirement and the rest of the deferred-life plan–there is no need to wait and every reason not to, especially in unpredictable economic times. Whether your dream is escaping the rat race, experiencing high-end world travel, earning a monthly five-figure income with zero management, or just living more and working less, The 4-Hour Workweek is the blueprint.",
		pages = 416,
		price = 26.95,
		weight = 635,
		dimensions = (14.9, 3.8, 21.6)
	},
	Book {
		title = "10 Mindful Minutes",
		author = "Goldie Hawn PHD",
		publisher = "Perigee",
		isbn10 = "039953606X",
		isbn13 = "978-0399536069",
		description = "Across the country, the revolutionary MindUP program, which was developed under the auspices of the Hawn Foundation, established by Goldie Hawn, is teaching children vital social and emotional skills. By understanding how their brains work, children discover where their emotions come from and become more self-aware. They learn to appreciate the sensory aspects of their lives and to value the positive effects of mindfulness, compassion, and kindness. This, in turn, empowers them to manage and reduce their own stress - and helps them be happy. Those who have seen the remarkable effects of this program have been eager to learn how to implement it in their own homes and use its practices for themselves, too. Now, for the first time, its secrets are being shared with all parents and children in \"10 Mindful Minutes\".",
		pages = 288,
		price = 28.00,
		weight = 363,
		dimensions = (20.8, 14.5, 2.3)
	},
	Book {
		title = "A New Earth: Awakening to You Life's Purpose (Oprah's Book Club, Selection 61)",
		author = "Eckhart Tolle",
		publisher = "Penguin",
		isbn10 = "0452289963",
		isbn13 = "978-0452289963",
		description = "With his bestselling spiritual guide The Power of Now, Eckhart Tolle inspired millions of readers to discover the freedom and joy of a life lived \"in the now.\" In A New Earth, Tolle expands on these powerful ideas to show how transcending our ego-based state of consciousness is not only essential to personal happiness, but also the key to ending conflict and suffering throughout the world. Tolle describes how our attachment to the ego creates the dysfunction that leads to anger, jealousy, and unhappiness, and shows readers how to awaken to a new state of consciousness and follow the path to a truly fulfilling existence.",
		pages = 336,
		price = 15.50,
		weight = 272,
		dimensions = (13.5, 1.9, 20.3)
	},
	Book {
		title = "The Magic Of Thinking Big",
		author = "David Schwartz",
		publisher = "Touchstone",
		isbn10 = "0671646788",
		isbn13 = "978-0671646783",
		description = "Millions of people throughout the world have improved their lives using The Magic of Thinking Big. Dr. David J. Schwartz, long regarded as one of the foremost experts on motivation, will help you sell better, manage better, earn more money, and -- most important of all -- find greater happiness and peace of mind. The Magic of Thinking Big gives you useful methods, not empty promises. Dr. Schwartz presents a carefully designed program for getting the most out of your job, your marriage and family life, and your community. He proves that you don't need to be an intellectual or have innate talent to attain great success and satisfaction -- but you do need to learn and understand the habit of thinking and behaving in ways that will get you there. This book gives you those secrets!",
		pages = 320,
		price = 15.50,
		weight = 281,
		dimensions = (14, 2, 21.3)
	}, 
	Book {
		title = "Quiet: The Power of Introverts in a World That Can't Stop Talking",
		author = "Susan Cain",
		publisher = "Crown",
		isbn10 = "0307352145",
		isbn13 = "978-0307352149",
		description = "Passionately argued, impressively researched, and filled with indelible stories of real people, Quiet shows how dramatically we undervalue introverts, and how much we lose in doing so. Taking the reader on a journey from Dale Carnegie’s birthplace to Harvard Business School, from a Tony Robbins seminar to an evangelical megachurch, Susan Cain charts the rise of the Extrovert Ideal in the twentieth century and explores its far-reaching effects. She talks to Asian-American students who feel alienated from the brash, backslapping atmosphere of American schools. She questions the dominant values of American business culture, where forced collaboration can stand in the way of innovation, and where the leadership potential of introverts is often overlooked. And she draws on cutting-edge research in psychology and neuroscience to reveal the surprising differences between extroverts and introverts.",
		pages = 352,
		price = 28.00,
		weight = 567,
		dimensions = (16.3, 3, 24.3)
	}, 
	Book {
		title = "The Gifts of Imperfection: Let Go of Who You Think You're Supposed to Be and Embrace Who You Are",
		author = "Brene Brown Ph.D.",
		publisher = "Hazelden",
		isbn10 = "159285849X",
		isbn13 = "978-1592858491",
		description = "This important book is about the lifelong journey from 'What will people think?' to 'I am enough.' Brown's unique ability to blend original research with honest storytelling makes reading The Gifts of Imperfection like having a long, uplifting conversation with a very wise friend who offers compassion, wisdom, and great advice.' Harriet Lerner, New York Times best-selling author of The Dance of Anger and The Dance of Connection 'Brené Brown courageously tackles the dark emotions that get in the way of leading a fuller life; read this book and let some of that courage rub off on you.' Daniel H. Pink, New York Times best-selling author of A Whole New Mind 'Courage, compassion, and connection: Through Brené's research, observations, and guidance, these three little words can open the door to amazing change in your life.' Ali Edwards, author of Life Artist In The Gifts of Imperfection, Brené Brown, a leading expert on shame, authenticity, and belonging, shares ten guideposts on the power of Wholehearted living a way of engaging with the world from a place of worthiness. Each day we face a barrage of images and messages from society and the media telling us who, what, and how we should be. We are led to believe that if we could only look perfect and lead perfect lives, we'd no longer feel inadequate. So most of us perform, please, and perfect, all the while thinking, What if I can't keep all of these balls in the air? Why isn't everyone else working harder and living up to my expectations? What will people think if I fail or give up? When can I stop proving myself? In The Gifts of Imperfection, Brené Brown, Ph.D., a leading expert on shame, authenticity and belonging, shares what she's learned from a decade of research on the power of Wholehearted Living a way of engaging with the world from a place of worthiness. In her ten guideposts, Brown engages our minds, hearts, and spirits as she explores how we can cultivate the courage, compassion, and connection to wake up in the morning and think, No matter what gets done and how much is left undone, I am enough, And to go to bed at night thinking, Yes, I am sometimes afraid, but I am also brave. And, yes, I am imperfect and vulnerable, but that doesn't change the truth that I am worthy of love and belonging.",
		pages = 160,
		price = 16.50,
		weight = 340,
		dimensions = (22.6, 15, 1.3)
	}, 
	Book {
		title = "Getting Things Done",
		author = "David Allen",
		publisher = "Penguin",
		isbn10 = "0142000280",
		isbn13 = "978-0142000281",
		description = "",
		pages = 288,
		price = 18.50,
		weight = 288,
		dimensions = (13.5, 1.6, 20.3)
	}, 
	Book {
		title = "Think & Grow Rich",
		author = "Napoleon Hill",
		publisher = "Dover Publications",
		isbn10 = "0486459462",
		isbn13 = "978-0486459462",
		description = "With the help of industrialist Andrew Carnegie, the author of this remarkable book spent two decades interviewing hundreds of people renowned for their wealth and achievement. He distills the collective wisdom of Henry Ford, Thomas Edison, John D. Rockefeller, and others, offering priceless advice on positive thinking and overcoming adversity.",
		pages = 272,
		price = 9.25,
		weight = 272,
		dimensions = (21, 13.9, 1.4)
	}, 
	Book {
		title = "Weight Loss Cure \"They\" Don't Want You to Know About",
		author = "Kevin Trudeau",
		publisher = "Alliance Publisher",
		isbn10 = "0978785142",
		isbn13 = "978-0978785147",
		description = "An absolute cure for obesity was discovered almost fifty years ago by a British medical doctor. Tens of thousands of people used this simple, inexpensive, safe medical treatment and achieved miraculous, fast, and permanent weight loss. Stubborn area fat deposits melted away. Body reshaping of the hips, thighs, buttocks, and waist was so dramatic it appeared as if the patients received liposuction! Amazingly, this medical breakthrough has been debunked, discredited, and suppressed by the American Medical Association, the Food and Drug Administration, and other medical establishments throughout the world. Now, for the first time in fifty years, this revolutionary breakthrough discovery, which permanently cures the condition of obesity, is being released to the public.The main problems that overweight people deal with are massive, intense, constant physical hunger; food cravings and uncontrollable urges to eat when not hungry; low metabolism; and an abnormally high amount of fat stored in stubborn secure problem areas such as the hips, thighs, buttocks, and waist. This “weight loss cure protocol” has been proven to be virtually 100% successful in correcting these conditions, thus curing the individual of obesity for life! Read the fascinating true story of how this discovery was made and, more importantly, how this miracle weight loss breakthrough has been hidden from the public so that drug companies can make billions of dollars selling their expensive drug treatments and surgical procedures for obesity. You’ll be amazed to read how the food manufacturers actually have a financial incentive to make you fat! This is the book that answers all the questions about why people today are continually getting fatter and fatter. The good news is this book gives you the cure that can solve your overweight condition once and for all.",
		pages = 288,
		price = 8.99,
		weight = 113,
		dimensions = (16.8, 10.4, 1.8)
	}]

history = [
	Book {
		title = "Civilization: The West and the Rest",
		author = "Niall Ferguson",
		publisher = "Penguin",
		isbn10 = "1594203059",
		isbn13 = "978-1594203053",
		description = "In Civilization: The West and the Rest, bestselling author Niall Ferguson argues that, beginning in the fifteenth century, the West developed six powerful new concepts that the Rest lacked: competition, science, the rule of law, consumerism, modern medicine, and the work ethic. These were the \"killer applications\" that allowed the West to leap ahead of the Rest, opening global trade routes, exploiting newly discovered scientific laws, evolving a system of representative government, more than doubling life expectancy, unleashing the Industrial Revolution, and embracing a dynamic work ethic. Civilization shows just how fewer than a dozen Western empires came to control more than half of humanity and four fifths of the world economy.",
		pages = 400,
		price = 40.50,
		weight = 680,
		dimensions = (15.2, 22.9, 1)
	}, 
	Book {
		title = "Guns, Germs, and Steel",
		author = "Jared Diamond",
		publisher = "Penguin",
		isbn10 = "0393317552",
		isbn13 = "978-0393317558",
		description = "In this \"artful, informative, and delightful\" (William H. McNeill, New York Review of Books) book, Jared Diamond convincingly argues that geographical and environmental factors shaped the modern world. Societies that had a head start in food production advanced beyond the hunter-gatherer stage, and then developed writing, technology, government, and organized religion—as well as nasty germs and potent weapons of war—and adventured on sea and land to conquer and decimate preliterate cultures. A major advance in our understanding of human societies, Guns, Germs, and Steel chronicles the way that the modern world came to be and stunningly dismantles racially based theories of human history.",
		pages = 480,
		price = 22.00,
		weight = 680,
		dimensions = (23.4, 15.5, 3.8)
	}, 
	Book {
		title = "The Better Angels of Our Nature: Why Violence Has Declined",
		author = "Steven Pinker",
		publisher = "Penguin",
		isbn10 = "0670022950",
		isbn13 = "978-0670022953",
		description = "Faced with the ceaseless stream of news about war, crime, and terrorism, one could easily think we live in the most violent age ever seen. Yet as New York Times bestselling author Steven Pinker shows in this startling and engaging new work, just the opposite is true: violence has been diminishing for millennia and we may be living in the most peaceful time in our species's existence. For most of history, war, slavery, infanticide, child abuse, assassinations, pogroms, gruesome punishments, deadly quarrels, and genocide were ordinary features of life. But today, Pinker shows (with the help of more than a hundred graphs and maps) all these forms of violence have dwindled and are widely condemned. How has this happened?",
		pages = 848,
		price = 46.00,
		weight = 1200,
		dimensions = (23.9, 16.5, 4.6)
	}, 
	Book {
		title = "A Short History of Progress",
		author = "Ronals Wright",
		publisher = "Anansi",
		isbn10 = "0887847064",
		isbn13 = "978-0887847066",
		description = "Each time history repeats itself, so it's said, the price goes up. The twentieth century was a time of runaway growth in human population, consumption, and technology, placing a colossal load on all natural systems, especially earth, air, and water--the very elements of life. The most urgent questions of the twenty-first century are: where will this growth lead? can it be consolidated or sustained? and what kind of world is our present bequeathing to our future? In A Short History of Progress Ronald Wright argues that our modern predicament is as old as civilization, a 10,000-year experiment we have participated in but seldom controlled. Only by understanding the patterns of triumph and disaster that humanity has repeated around the world since the Stone Age can we recognize the experiment's inherent dangers, and, with luck and wisdom, shape its outcome.",
		pages = 224,
		price = 19.95,
		weight = 249,
		dimensions = (20.1, 12.7, 1.8)
	}, 
	Book {
		title = "Man's Search for Meaning",
		author = "Viktor Frankl",
		publisher = "Beacon Press",
		isbn10 = "080701429X",
		isbn13 = "978-0807014295",
		description = "Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Between 1942 and 1945 Frankl labored in four different camps, including Auschwitz, while his parents, brother, and pregnant wife perished. Based on his own experience and the experiences of others he treated later in his practice, Frankl argues that we cannot avoid suffering but we can choose how to cope with it, find meaning in it, and move forward with renewed purpose. Frankl's theory-known as logotherapy, from the Greek word logos (\"meaning\")-holds that our primary drive in life is not pleasure, as Freud maintained, but the discovery and pursuit of what we personally find meaningful.",
		pages = 184,
		price = 7.99,
		weight = 91,
		dimensions = (10.6, 1.4, 17.1)
	}, 
	Book {
		title = "Never Far Away",
		author = "Anna Heilman",
		publisher = "080701429X",
		isbn10 = "080701429X",
		isbn13 = "978-1552380406",
		description = "From the memories of Anna Heilman, comes a wrenching and raw memoir of a young girl’s fight for survival in Auschwitz during the Holocaust. Born into the comfort and security of an assimilated Jewish family in prewar Warsaw, Anna’s once simple life quickly turned into a life of tragic loss, infinite resilience, and enduring love. Descriptions of Anna’s Jewish-Polish life before war along with remembered stories of her sister, who was hanged by the SS for her role in the Gunpowder Plot to destroy Auschwitz crematoriums, and her struggle to go on in the face of ineffable Nazi dehumanization culminate in an unforgettable story of the triumph of the human spirit.With gripping immediacy, Never Far Away immortalizes one woman’s love for her sister and the painful search for closure to a nightmare that has haunted her for over fifty years.",
		pages = 184,
		price = 24.95,
		weight = 259,
		dimensions = (23, 15.1, 1.2)
	}, 
	Book {
		title = "Fair Country: Telling Truths About Canada",
		author = "John Ralston Saul",
		publisher = "Penguin ",
		isbn10 = "0143168428",
		isbn13 = "978-0143168423",
		description = "In this startlingly original vision of Canada, renowned thinker John Ralston Saul argues that Canada is a Métis nation, heavily influenced and shaped by Aboriginal ideas: Egalitarianism, a proper balance between individual and group, and a penchant for negotiation over violence are all Aboriginal values that Canada absorbed. An obstacle to our progress, Saul argues, is that Canada has an increasingly ineffective elite, a colonial non-intellectual business elite that doesn't believe in Canada. It is critical that we recognize these aspects of the country in order to rethink it's future.",
		pages = 360,
		price = 20.00,
		weight = 386,
		dimensions = (20.8, 13.2, 2.8)
	}]

law = [
	Book {
		title = "War Law: Understanding International Law and Armed Conflict",
		author = "Michael Byers",
		publisher = "Grove/Atlantic",
		isbn10 = "080214294X",
		isbn13 = "978-0802142948",
		description = "The international rules governing the use of military force are under unprecedented scrutiny following the removal of Slobodan Milosevic and Saddam Hussein in wars not sanctioned by the United Nations (UN). Michael Byers' authoritative book addresses five broad issues: u.n. Security Council authorization, self-defence against terrorism, pre-emptive war, humanitarian and pro-democratic intervention, and the protection of civilians and combatants during armed conflict. His conclusion is that the global legal environment matters and its influence is often understated and undervalued. War Law is an informative and stimulating read about these continually divisive, critically important issues.",
		pages = 214,
		price = 16.30,
		weight = 249,
		dimensions = (20.3, 13.7, 1.5)
	},
	Book {
		title = "Make Sure It's Deductible, Fourth Edition",
		author = "Evelyn Jacks",
		publisher = "McGraw-Hill",
		isbn10 = "0071714839",
		isbn13 = "978-0071714839",
		description = "No matter what kind of small business you have, you owe it to yourself to take advantage of every legitimate business deduction and personal tax planning advantage at tax time. In the newly updated fourth edition of Make Sure It’s Deductible, Evelyn Jacks, Canada’s bestselling and most trusted tax author and educator, delivers vital tax facts that will save you money—presented in a clear, friendly style that’s easy to read, understand and apply to your own business.",
		pages = 240,
		price = 22.95,
		weight = 399,
		dimensions = (23.3, 18, 1.6)
	},
	Book {
		title = "Criminology: A Canadian Perspective",
		author = "Rick Linden",
		publisher = "Nelson College Indigenous",
		isbn10 = "0176441905",
		isbn13 = "978-0176441906",
		description = "This best-selling introductory text offers a strong balance of theoretical perspectives, along with an outstanding list of contributing authors. It is the most solid and accessible introduction to the discipline available. Criminology provides students with basic background information about crime as well as a clear understanding of all the major theories of criminology including sociological and psychological explanations. It concludes with a discussion on the most serious and frequent types of crime. Written by Canadians for Canadians, Criminology, sixth edition, continues to present the work of this country's foremost criminologists in combination with the most relevant research from around the world. This new edition has 2 new chapters and includes cutting edge content that is not covered in many criminology texts.",
		pages = 535,
		price = 109.95,
		weight = 975,
		dimensions = (25.1, 20.3, 2.3)
	},
	Book {
		title = "Montreal's Irish Mafia: The True Story of the Infamous West End Gang",
		author = "D'Arcy O'Connor",
		publisher = "Wiley",
		isbn10 = "0470158905",
		isbn13 = "978-0470158906",
		description = "Their names resonate with organized crime in Montreal: the Matticks, MacAllisters, Johnstons and Griffins, and Peter Dunie Ryan. They are the Irish equivalent of the infamous Rizzuto and Cotroni families, and the \"Mom\" Bouchers and Walter Stadnicks of the Hells Angels. Award-winning producer, journalist and author D’Arcy O’Connor narrates the genesis and rise to power of one of Montreal’s most powerful, violent and colorful criminal organizations. It is the West End Gang, whose members controlled the docks and fought the Hells Angels and Mafia for their share of the city’s prostitution, gambling, loan sharking and drug dealing. At times, they did not disdain forging alliances with rival gangs when huge profits were at stake, or when a killing needed to be carried out. ",
		pages = 288,
		price = 24.95,
		weight = 381,
		dimensions = (13.8, 1.5, 21.3)
	},
	Book {
		title = "The End of Lawyers?: Rethinking the nature of legal services",
		author = "Richard Susskind",
		publisher = "Oxford University Press",
		isbn10 = "0199593612",
		isbn13 = "978-0199593613",
		description = "This widely acclaimed legal bestseller has provoked a tidal wave of debate within the legal profession, being hailed as an inspiration by some and as heresy by others. Susskind lays down a challenge to all lawyers, and indeed all those in a professional service environment. He urges them to ask themselves, with their hands on their hearts, what elements of their current workload could be undertaken differently - more quickly, cheaply, efficiently, or to a higher quality - using alternative methods of working. The challenge for legal readers is to identify their distinctive skills and talents, the capabilities that they possess that cannot, crudely, be replaced by advanced systems or by less costly workers supported by technology or standard processes, or by lay people armed with online self-help tools. In the extended new preface to this revised paperback edition, Richard Susskind updates his views on legal process outsourcing, courtroom technology, access to justice, e-learning for lawyers, and the impact of the recession on the practice of law. He analyses the four main pressures that lawyers now face (to charge less, to work differently, to embrace technology, and to deregulate), and reveals common fallacies associated with each. And, in an entirely new line of thinking, Susskind argues that law firms and in-house departments will have four business models from which to choose in the future, and he provides some new tools and techniques to help lawyers plan for their future. Susskind argues that the market is increasingly unlikely to tolerate expensive lawyers for tasks (guiding, advising, drafting, researching, problem-solving, and more) that can equally or better be discharged, directly or indirectly, by smart systems and processes. It follows, the book claims, that the jobs of many traditional lawyers will be substantially eroded and often eliminated. Two forces propel the legal profession towards this scenario: a market pull towards commoditisation and a pervasive development and uptake of information technology. At the same time, the book foresees new law jobs emerging which may be highly rewarding, even if very different from those of today. The End of Lawyers represents a compelling vision of the future of the legal profession and a must-read for all lawyers. Indeed this book should be read by all those whose work touches on the law, and it offers much food for thought for anyone working in a professional environment.",
		pages = 352,
		price = 29.95,
		weight = 476,
		dimensions = (23.1, 15.5, 1.8)
	}]

literatureFiction = [
	Book {
		title = "The Girl Who Kicked the Hornet's Nest",
		author = "Stieg Larsson",
		publisher = "Penguin",
		isbn10 = "0143170112",
		isbn13 = "978-0143170112",
		description = "As The Girl Who Kicked the Hornet's Nest opens, Lisbeth Salander—the heart and soul of Larsson's two previous novels—is under close supervision in the intensive care unit of a provincial Swedish city hospital. And she's fighting for her life in more ways than one: when she's well enough, she'll be taken back to Stockholm to stand trial for a triple murder. With the help of her friend, journalist Mikael Blomkvist, she will have to prove her innocence, and identify and denounce the corrupt politicians who have allowed the vulnerable, like herself, to become victims of abuse and violence. And, on her own, she will plot her revenge—against the man who tried to kill her, and the government institutions that very nearly destroyed her life.",
		pages = 576,
		price = 18.00,
		weight = 544,
		dimensions = (20.8, 13.2, 4.3)
	},
	Book {
		title = "Before I Go To Sleep",
		author = "S. Watson",
		publisher = "HarperCollins Publishers Ltd",
		isbn10 = "1443404063",
		isbn13 = "978-1443404068",
		description = "Christine wakes up every morning in an unfamiliar bed with an unfamiliar man. She looks in the mirror and sees an unfamiliar, middle-aged face. And every morning, the man she has woken up with must explain that he is Ben, he is her husband, she is forty-seven years old, and a terrible accident two decades earlier decimated her ability to form new memories. But it's the phone call from a Dr. Nash, a neurologist who claims to be working with Christine without her husband's knowledge, that directs her to her journal, hidden in the back of her closet. For the past few weeks, Christine has been recording her daily activities -- tearful mornings with Ben, sessions with Dr. Nash, flashes of scenes from her former life -- and rereading past entries, relearning the facts of her life as retold by the husband she is completely dependent upon. As the entries build up, Christine asks many questions. What was life like before the accident? Why did she and Ben never have a child? What has happened to Christine's best friend? And what exactly was the horrific accident that caused such a profound loss of memory? Every day, Christine must begin again the reconstruction of her past. And the closer she gets to the truth, the more unbelievable it seems.",
		pages = 368,
		price = 21.99,
		weight = 408,
		dimensions = (22.9, 15.2, 2.8)
	},
	Book {
		title = "The Sisters Brothers",
		author = "Patrick Dewitt",
		publisher = "House of Anansi Press",
		isbn10 = "1770890327",
		isbn13 = "978-1770890329",
		description = "Shortlisted for the Man Booker Prize 2011. Hermann Kermit Warm is going to die. The enigmatic and powerful man known only as the Commodore has ordered it, and his henchmen, Eli and Charlie Sisters, will make sure of it. Though Eli doesn’t share his brother’s appetite for whiskey and killing, he’s never known anything else. But their prey isn’t an easy mark, and on the road from Oregon City to Warm’s gold-mining claim outside Sacramento, Eli begins to question what he does for a living — and whom he does it for. With The Sisters Brothers, Patrick deWitt pays homage to the classic Western, transforming it into an unforgettable comic tour de force. Filled with a remarkable cast of characters — losers, cheaters, and ne’er-do-wells from all stripes of life — and told by a complex and compelling narrator, it is a violent, lustful odyssey through the underworld of the 1850s frontier that beautifully captures the humour, melancholy, and grit of the Old West and two brothers bound by blood, violence, and love.",
		pages = 344,
		price = 22.95,
		weight = 386,
		dimensions = (22.6, 15.2, 2.8)
	},
	Book {
		title = "Girl Who Played With Fire",
		author = "Stieg Larsson",
		publisher = "Penguin",
		isbn10 = "0143170139",
		isbn13 = "978-0143170136",
		description = "",
		pages = 512,
		price = 18.00,
		weight = 522,
		dimensions = (20.8, 13.5, 3.8)
	},
	Book {
		title = "The Girl With the Dragon Tattoo",
		author = "Steig Larsson",
		publisher = "Penguin",
		isbn10 = "0143170120",
		isbn13 = "978-0143170129",
		description = "Forty years ago, Harriet Vanger disappeared off the secluded island owned and inhabited by the powerful Vanger family. There was no corpse, no witnesses, no evidence. But her uncle, Henrik, is convinced that she was murdered by someone from her own deeply dysfunctional family. Disgraced journalist Mikael Blomkvist is hired to investigate, but he quickly finds himself in over his head. He hires a competent assistant: the gifted and conscience-free computer specialist Lisbeth Salander, and the two unravel a dark and appalling family history. But the Vangers are a secretive clan, and Blomkvist and Salander are about to find out just how far they are prepared to go to protect themselves.",
		pages = 480,
		price = 18.00,
		weight = 476,
		dimensions = (20.8, 13.2, 3.6)
	},
	Book {
		title = "Half-Blood Blues",
		author = "Esi Edugyan",
		publisher = "Thomas Allen",
		isbn10 = "0887627412",
		isbn13 = "978-0887627415",
		description = "Paris, 1940.  A brilliant jazz musician, Hiero, is arrested by the Nazis and never heard from again.  He is twenty years old.  He is a German citizen.  And he is black. Fifty years later, his friend and fellow musician, Sid, must relive that unforgettable time, revealing the friendships, love affairs and treacheries that sealed Hiero’s fate.  From the smoky bars of pre-war Berlin to the salons of  Paris - where the legendary Louis Armstrong makes an appearance – Sid, with his distinctive and rhythmic German-American slang, leads the reader through a fascinating world alive with passion, music and the spirit of resistance. Half-Blood Blues, the second novel by an exceptionally talented young writer, is an entrancing, electric story about jazz, race, love and loyalty, and the sacrifices we ask of ourselves, and demand of others, in the name of art.",
		pages = 304,
		price = 24.95,
		weight = 431,
		dimensions = (21.4, 13.8, 2.4)
	},
	Book {
		title = "The Help",
		author = "Kathryn Stockett",
		publisher = "Penguin",
		isbn10 = "0425232204",
		isbn13 = "978-0425232200",
		description = "Be prepared to meet three unforgettable women: Twenty-two-year-old Skeeter has just returned home after graduating from Ole Miss. She may have a degree, but it is 1962, Mississippi, and her mother will not be happy till Skeeter has a ring on her finger. Skeeter would normally find solace with her beloved maid Constantine, the woman who raised her, but Constantine has disappeared and no one will tell Skeeter where she has gone. Aibileen is a black maid, a wise, regal woman raising her seventeenth white child. Something has shifted inside her after the loss of her own son, who died while his bosses looked the other way. She is devoted to the little girl she looks after, though she knows both their hearts may be broken. Minny, Aibileen's best friend, is short, fat, and perhaps the sassiest woman in Mississippi. She can cook like nobody's business, but she can't mind her tongue, so she's lost yet another job. Minny finally finds a position working for someone too new to town to know her reputation. But her new boss has secrets of her own. Seemingly as different from one another as can be, these women will nonetheless come together for a clandestine project that will put them all at risk. And why? Because they are suffocating within the lines that define their town and their times. And sometimes lines are made to be crossed.",
		pages = 528,
		price = 18.50,
		weight = 408,
		dimensions = (20.8, 12.7, 3)
	},
	Book {
		title = "Go the F**k to Sleep",
		author = "Adam Mansbach",
		publisher = "Akashic Books",
		isbn10 = "1617750255",
		isbn13 = "978-1617750250",
		description = "Go the F*** to Sleep is a bedtime book for parents who live in the real world, where a few snoozing kitties and cutesy rhymes don't always send a toddler sailing blissfully off to dreamland. Profane, affectionate, and radically honest, California Book Award-winning author Adam Mansbach's verses perfectly capture the familiar--and unspoken--tribulations of putting your little angel down for the night. In the process, they open up a conversation about parenting, granting us permission to admit our frustrations, and laugh at their absurdity.",
		pages = 32,
		price = 16.95,
		weight = 181,
		dimensions = (15.7, 21.3, 1)
	},
	Book {
		title = "Sarah's Key",
		author = "Tatiana de Rosney",
		publisher = "St. Martin's Griffin",
		isbn10 = "0312370849",
		isbn13 = "978-0312370848",
		description = "Paris, July 1942: Sarah, a ten year-old girl, is brutally arrested with her family by the French police in the Vel’ d’Hiv’ roundup, but not before she locks her younger brother in a cupboard in the family's apartment, thinking that she will be back within a few hours. Paris, May 2002: On Vel’ d’Hiv’s 60th anniversary, journalist Julia Jarmond is asked to write an article about this black day in France's past. Through her contemporary investigation, she stumbles onto a trail of long-hidden family secrets that connect her to Sarah. Julia finds herself compelled to retrace the girl's ordeal, from that terrible term in the Vel d'Hiv', to the camps, and beyond. As she probes into Sarah's past, she begins to question her own place in France, and to reevaluate her marriage and her life. Tatiana de Rosnay offers us a brilliantly subtle, compelling portrait of France under occupation and reveals the taboos and silence that surround this painful episode.",
		pages = 320,
		price = 15.50,
		weight = 272,
		dimensions = (20.8, 14, 2.5)
	},
	Book {
		title = "A Dance with Dragons: A Song of Ice and Fire: Book Five",
		author = "George R. R. Martin",
		publisher = "Bantam",
		isbn10 = "0553801473",
		isbn13 = "978-0553801477",
		description = "In the aftermath of a colossal battle, the future of the Seven Kingdoms hangs in the balance—beset by newly emerging threats from every direction. In the east, Daenerys Targaryen, the last scion of House Targaryen, rules with her three dragons as queen of a city built on dust and death. But Daenerys has thousands of enemies, and many have set out to find her. As they gather, one young man embarks upon his own quest for the queen, with an entirely different goal in mind.",
		pages = 1040,
		price = 38.00,
		weight = 1500,
		dimensions = (16.5, 5.5, 24.2)
	},
	Book {
		title = "The Cat's Table",
		author = "Michael Ondaatje",
		publisher = "McClelland & Stewart",
		isbn10 = "0771068646",
		isbn13 = "978-0771068645",
		description = "In the early 1950s, an eleven-year-old boy boards a huge liner bound for England. At mealtimes, he is placed at the lowly \"Cat's Table\" with an eccentric and unforgettable group of grownups and two other boys. As the ship makes its way across the Indian Ocean, through the Suez Canal, into the Mediterranean, the boys find themselves immersed in the worlds and stories of the adults around them. At night they spy on a shackled prisoner -- his crime and fate a galvanizing mystery that will haunt them forever.",
		pages = 288,
		price = 32.00,
		weight = 499,
		dimensions = (21.4, 15.2, 2.8)
	},
	Book {
		title = "The Night Circus",
		author = "Erin Morgenstern",
		publisher = "Doubleday Canada",
		isbn10 = "0385671717",
		isbn13 = "978-0385671712",
		description = "The circus arrives at night, without warning. No announcements precede it. It is simply there, when yesterday it was not. Within nocturnal black and white striped tents awaits a unique experience, a feast for the senses, where one can get lost in a maze of clouds, meander through a lush garden made of ice, stand awestruck as a tattooed contortionist folds herself into a small glass box, and gaze in wonderment at an illusionist performing impossible feats of magic.",
		pages = 400,
		price = 32.00,
		weight = 771,
		dimensions = (23.6, 16.3, 4.3)
	},
	Book {
		title = "The Winter Palace",
		author = "Eva Stachniak",
		publisher = "Doubleday Canada",
		isbn10 = "038566656X",
		isbn13 = "978-0385666565",
		description = "Behind every great ruler lies a betrayal. Eva Stachniak's novel sweeps readers into the passionate, intimate, and treacherous world of Catherine the Great, revealing Russia's greatest matriarch from her earliest days in court, where the most valuable currency was the secrets of nobility and the most dangerous weapon to wield was ambition. Two young women, caught in the landscape of shifting allegiances, navigate the treacherous waters of palace intrigue. Barbara is a servant who will become one of Russia's most cunning royal spies. Sophia is a pretty, naive German duchess who will become Catherine the Great. For readers of superb historical fiction, Eva Stachniak captures in glorious detail the opulence of royalty and the perilous loyalties of the Russian court.",
		pages = 464,
		price = 24.95,
		weight = 612,
		dimensions = (23.1, 15.7, 3.6)
	},
	Book {
		title = "The Walking Dead Volume 15 TP",
		author = "Robert Kirkman",
		publisher = "Image Comics",
		isbn10 = "1607064405",
		isbn13 = "978-1607064404",
		description = "The events of No Way Out have affected everyone in the Community, and not everyone has survived to pick up the pieces. Reprinting issues #85-90 of the Eisner Award-winning series, The Walking Dead. Reprint Edition",
		pages = 132,
		price = 18.99,
		weight = 340,
		dimensions = (25.4, 16.3, 1)
	},
	Book {
		title = "1Q84",
		author = "Haruki Murakami",
		publisher = "Bond Street Books",
		isbn10 = "0385669437",
		isbn13 = "978-0385669436",
		description = "The year is 1984. Aomame is riding in a taxi on the expressway, in a hurry to carry out an assignment. Her work is not the kind that can be discussed in public. When they get tied up in traffic, the taxi driver suggests a bizarre 'proposal' to her. Having no other choice she agrees, but as a result of her actions she starts to feel as though she is gradually becoming detached from the real world. She has been on a top secret mission, and her next job leads her to encounter the superhuman founder of a religious cult. Meanwhile, Tengo is leading a nondescript life but wishes to become a writer. He inadvertently becomes involved in a strange disturbance that develops over a literary prize. While Aomame and Tengo impact on each other in various ways, at times by accident and at times intentionally, they come closer and closer to meeting. Eventually the two of them notice that they are indispensable to each other. Is it possible for them to ever meet in the real world?",
		pages = 944,
		price = 35.00,
		weight = 1300,
		dimensions = (23.4, 16, 5.1)
	},
	Book {
		title = "The Virgin Cure",
		author = "Ami McKay",
		publisher = "Knopf Canada",
		isbn10 = "0676979564",
		isbn13 = "978-0676979565",
		description = "Following in the footsteps of The Birth House, her powerful debut novel, The Virgin Cure secures Ami McKay's place as one of our most beguiling storytellers. (Not that it has to… that is pretty much taken care of!)\n\"I am Moth, a girl from the lowest part of Chrystie Street, born to a slum-house mystic and the man who broke her heart.\" So begins The Virgin Cure, a novel set in the tenements of lower Manhattan in the year 1871. As a young child, Moth's father smiled, tipped his hat and walked away from his wife and daughter forever, and Moth has never stopped imagining that one day they may be reunited – despite knowing in her heart what he chose over them. Her hard mother is barely making a living with her fortune-telling, sometimes for well-heeled clients, yet Moth is all too aware of how she really pays the rent.",
		pages = 368,
		price = 32.00,
		weight = 499,
		dimensions = (21.3, 14.7, 3.6)
	},
	Book {
		title = "Bossypants",
		author = "Tina Fey",
		publisher = "Reagan Arthur/Back Bay Books",
		isbn10 = "0316056871",
		isbn13 = "978-0316056878",
		description = "At last, Tina Fey's story can be told. From her youthful days as a vicious nerd to her tour of duty on Saturday Night Live; from her passionately halfhearted pursuit of physical beauty to her life as a mother eating things off the floor; from her one-sided college romance to her nearly fatal honeymoon -- from the beginning of this paragraph to this final sentence.",
		pages = 304,
		price = 17.50,
		weight = 318,
		dimensions = (14, 1.9, 21)
	},
	Book {
		title = "The Kitchen House: A Novel",
		author = "Kathleen Grissom",
		publisher = "Touchstone",
		isbn10 = "1439153663",
		isbn13 = "978-1439153666",
		description = "Lavinia, a seven-year-old Irish orphan with no memory of her past, arrives on a tobacco plantation where she is put to work as an indentured servant. Placed with the slaves in the kitchen house under the care of Belle, the master’s illegitimate daughter, Lavinia becomes deeply bonded to her new adopted family, even though she is forever set apart from them by her white skin. As Lavinia is slowly accepted into the world of the big house, where the master is absent and the mistress battles an opium addiction, she finds herself perilously straddling two very different worlds. When Lavinia marries the master’s troubled son and takes on the role of mistress, loyalties are brought into question, dangerous truths are laid bare and lives are put at risk. The Kitchen House is a tragic story of page-turning suspense, exploring the meaning of family, where love and loyalty prevail..",
		pages = 384,
		price = 17.50,
		weight = 299,
		dimensions = (20.3, 13.2, 2.3)
	},
	Book {
		title = "The Scottish Prisoner",
		author = "Diana Gabaldon",
		publisher = "Doubleday Canada",
		isbn10 = "0385660987",
		isbn13 = "978-0385660983",
		description = "Jamie Fraser, a Scottish Jacobite officer paroled as a prisoner of war on an estate in the Lake District, finds the numbness of his days disturbed. First, by dreams of his dead wife, then by the presence of the small son he cannot claim. Much more disturbing is the sudden reappearance in his life of Lord John Grey, with a summons that will take him - again - from everything he values. A legacy from a dead friend has led Lord John and his brother Hal in pursuit of a corrupt army officer, along a trail of politics and murder. The matter becomes critical when the trail leads into Ireland, with a baffling message left in the tongue called \"Erse\" - the language spoken by Scottish Highlanders. Jamie is forced to help the Greys, in order to guard his own secrets. But the Greys have secrets, too, which may deprive him of his life, as well as his liberty.",
		pages = 560,
		price = 32.95,
		weight = 658,
		dimensions = (21.2, 14.4, 5)
	},
	Book {
		title = "The Heroes of Olympus, Book Two: The Son of Neptune",
		author = "Rick Riordan",
		publisher = "Dysney-Hyperion",
		isbn10 = "1423140591",
		isbn13 = "978-1423140597",
		description = "Beginning at the “other” camp for half-bloods and extending as far north as the land beyond the gods, this breathtaking second installment in the Heroes of Olympus series introduces new demigods, revives fearsome monsters, and features other remarkable creatures, all of whom are destined to play a part in the most important quest of all: the Prophecy of Seven. ",
		pages = 544,
		price = 21.99,
		weight = 703,
		dimensions = (21.1, 15, 4.3)
	},
	Book {
		title = "Those Who Save Us",
		author = "Jenna Blum",
		publisher = "Harcourt, Inc.",
		isbn10 = "0156031663",
		isbn13 = "978-0156031660",
		description = "For fifty years, Anna Schlemmer has refused to talk about her life in Germany during World War II. Her daughter, Trudy, was only three when she and her mother were liberated by an American soldier and went to live with him in Minnesota. Trudy's sole evidence of the past is an old photograph: a family portrait showing Anna, Trudy, and a Nazi officer, the Obersturmfuhrer of Buchenwald. Driven by the guilt of her heritage, Trudy, now a professor of German history, begins investigating the past and finally unearths the dramatic and heartbreaking truth of her mother's life. Combining a passionate, doomed love story, a vivid evocation of life during the war, and a poignant mother/daughter drama, Those Who Save Us is a profound exploration of what we endure to survive and the legacy of shame.",
		pages = 496,
		price = 15.95,
		weight = 408,
		dimensions = (20.1, 13.3, 3)
	},
	Book {
		title = "11/22/63: A Novel",
		author = "Stephen King",
		publisher = "Simon & Schuster Canada",
		isbn10 = "1451660804",
		isbn13 = "978-1451660807",
		description = "It begins with Jake Epping, a thirty-five-year-old English teacher in Lisbon Falls, Maine, who makes extra money teaching GED classes. He asks his students to write about an event that changed their lives, and one essay blows him away—a gruesome, harrowing story about the night more than fifty years ago when Harry Dunning’s father came home and killed his mother, his sister, and his brother with a sledgehammer. Reading the essay is a watershed moment for Jake, his life—like Harry’s, like America’s in 1963—turning on a dime. Not much later his friend Al, who owns the local diner, divulges a secret: his storeroom is a portal to the past, a particular day in 1958. And Al enlists Jake to take over the mission that has become his obsession—to prevent the Kennedy assassination.",
		pages = 864,
		price = 39.99,
		weight = 1300,
		dimensions = (23.9, 16, 5.8)
	},
	Book {
		title = "Cutting for Stone",
		author = "Abraham Verghese",
		publisher = "Vintage Canada",
		isbn10 = "0307357783",
		isbn13 = "978-0307357786",
		description = "Marion and Shiva Stone are twin brothers born of a secret union between a beautiful Indian nun and a brash British surgeon at a mission hospital in Addis Ababa. Orphaned by their mother’s death in childbirth and their father’s disappearance, bound together by a preternatural connection and a shared fascination with medicine, the twins come of age as Ethiopia hovers on the brink of revolution. Yet it will be love, not politics — their passion for the same woman — that will tear them apart and force Marion, fresh out of medical school, to flee his homeland. He makes his way to America, finding refuge in his work as an intern at an underfunded, overcrowded New York City hospital. When the past catches up to him — nearly destroying him — Marion must entrust his life to the two men he thought he trusted least in the world: the surgeon father who abandoned him and the brother who betrayed him.",
		pages = 688,
		price = 22.00,
		weight = 476,
		dimensions = (20.3, 13.2, 3.8)
	},
	Book {
		title = "Secret Daughter",
		author = "Shilpi Somaya Gowda",
		publisher = "William Morrow",
		isbn10 = "0061974307",
		isbn13 = "978-0061974304",
		description = "On the eve of the monsoons, in a remote Indian village, Kavita gives birth to Asha. But in a culture that favours sons, the only way for Kavita to save her newborn daughter's life is to give her away. It is a decision that will haunt her and her husband for the rest of their lives, even after the arrival of their cherished son. Halfway around the globe, Somer, an American doctor, decides to adopt a child after making the wrenching discovery that she will never have one of her own. When she and her husband Krishnan see a photo of baby Asha from a Mumbai orphanage, they are overwhelmed with emotion for her. Somer knows life will change with the adoption, but is convinced that the love they already feel will overcome all obstacles. Interweaving the stories of Kavita, Somer, and Asha, \"Secret Daughter\" poignantly explores issues of culture and belonging. Moving between two worlds and two families, one struggling to survive in the fetid slums of Mumbai, the other grappling to forge a cohesive family despite their diverging cultural identities, this powerful debut novel marks the arrival of a fresh talent poised for great success.",
		pages = 352,
		price = 19.99,
		weight = 340,
		dimensions = (22.6, 15.2, 2.8)
	},
	Book {
		title = "Nineteen Eighty Four",
		author = "George Orwell",
		publisher = "Penguin UK",
		isbn10 = "0141036141",
		isbn13 = "978-0141036144",
		description = "Winston Smith works for the Ministry of Truth in London, chief city of Airstrip One. Big Brother stares out from every poster, the Thought Police uncover every act of betrayal. When Winston finds love with Julia, he discovers that life does not have to be dull and deadening, and awakens to new possibilities. Despite the police helicopters that hover and circle overhead, Winston and Julia begin to question the Party; they are drawn towards conspiracy. Yet Big Brother will not tolerate dissent - even in the mind. For those with original thoughts they invented Room 101...",
		pages = 336,
		price = 10.99,
		weight = 181,
		dimensions = (17.8, 10.9, 2.3)
	}]

romance = [
	Book {
		title = "Lothaire",
		author = "Kresley Cole",
		publisher = "Pocket Books",
		isbn10 = "1451664230",
		isbn13 = "978-1451664232",
		description = "Driven by his insatiable need for revenge, Lothaire, the Lore’s most ruthless vampire, plots to seize the Horde’s crown. But bloodlust and torture have left him on the brink of madness— until he finds Elizabeth Peirce, the key to his victory. He captures the unique young mortal, intending to offer up her very soul in exchange for power, yet Elizabeth soothes his tormented mind and awakens within him emotions Lothaire believed he could no longer experience.",
		pages = 480,
		price = 19.99,
		weight = 499,
		dimensions = (22.6, 15.2, 4)
	},
	Book {
		title = "Hidden Summit",
		author = "Robyn Carr",
		publisher = "Mira",
		isbn10 = "077831300X",
		isbn13 = "978-0778313007",
		description = "This story has everything: a courageous, outspoken heroine; a to-die-for hero; and a plot that will touch readers' hearts on several different levels. Truly excellent. -RT Book Reviews on Forbidden Falls",
		pages = 352,
		price = 9.99,
		weight = 159,
		dimensions = (16.8, 10.6, 2.5)
	},
	Book {
		title = "Lover Reborn",
		author = "J R Ward",
		publisher = "Signet (TRD)",
		isbn10 = "0451235843",
		isbn13 = "978-0451235848",
		description = "",
		pages = 512,
		price = 29.50,
		weight = 454,
		dimensions = (16.8, 10.6, 2.5)
	},
	Book {
		title = "One Day",
		author = "David Nicholls",
		publisher = "Vintage",
		isbn10 = "0307474712",
		isbn13 = "978-0307474711",
		description = "It’s 1988 and Dexter Mayhew and Emma Morley have only just met. But after only one day together, they cannot stop thinking about one another. Over twenty years, snapshots of that relationship are revealed on the same day—July 15th—of each year. Dex and Em face squabbles and fights, hopes and missed opportunities, laughter and tears. And as the true meaning of this one crucial day is revealed, they must come to grips with the nature of love and life itself.",
		pages = 448,
		price = 16.95,
		weight = 363,
		dimensions = (13.1, 2.4, 20.3)
	},
	Book {
		title = "Drums of Autumn",
		author = "Diana Gabaldon",
		publisher = "Seal Books",
		isbn10 = "0770427758",
		isbn13 = "978-0770427757",
		description = "It began in Scotland, at an ancient stone circle.  There, a doorway, open to a select few, leads into the past--or the grave.  Claire Randall survived the extraordinary passage, not once buy twice.  Her first trip swept her into the arms of Jamie Fraser, an eighteenth-century Scot whose love for her became legend--a tale of tragic passion that ended with her return to the present to bear his child.  Her second journey, two decades later, brought them together again in frontier America.  But Claire had left someone behind in the twentieth century.  Their daughter Brianna...",
		pages = 1088,
		price = 12.99,
		weight = 363,
		dimensions = (17.5, 10.7, 5.1)
	},
	Book {
		title = "The Weight of Silence",
		author = "Heather Gudenkauf",
		publisher = "Mira",
		isbn10 = "077832740X",
		isbn13 = "978-0778327400",
		description = "It happens quietly one August morning. As dawn's shimmering light drenches the humid Iowa air, two families awaken to find their little girls have gone missing in the night. Seven-year-old Calli Clark is sweet, gentle, a dreamer who suffers from selective mutism brought on by tragedy that pulled her deep into silence as a toddler. Calli's mother, Antonia, tried to be the best mother she could within the confines of marriage to a mostly absent, often angry husband. Now, though she denies that her husband could be involved in the possible abductions, she fears her decision to stay in her marriage has cost her more than her daughter's voice. Petra Gregory is Calli's best friend, her soul mate and her voice. But neither Petra nor Calli has been heard from since their disappearance was discovered. Desperate to find his child, Martin Gregory is forced to confront a side of himself he did not know existed beneath his intellectual, professorial demeanor. Now these families are tied by the question of what happened to their children. And the answer is trapped in the silence of unspoken family secrets.",
		pages = 384,
		price = 16.95,
		weight = 318,
		dimensions = (20.4, 15.2, 2.6)
	},
	Book {
		title = "Pride And Prejudice",
		author = "Jane Austen",
		publisher = "Penguin Classic",
		isbn10 = "0141040343",
		isbn13 = "978-0141040349",
		description = "'The moment I first met you, I noticed your pride, your sense of superiority, and your selfish disdain for the feelings of others. You are the last man in the world whom I could ever be persuaded to marry,' said Elizabeth Bennet. And so Elizabeth rejects the proud Mr Darcy. Can nothing overcome her prejudice against him? And what of the other Bennet girls - their fortunes, and misfortunes, in the business of getting husbands? This famous novel by Jane Austen is full of wise and humorous observation of the people and manners of her times.",
		pages = 432,
		price = 25.00,
		weight = 340,
		dimensions = (20.5, 13.4, 4)
	},
	Book {
		title = "Brothers Karamazov",
		author = "Fyodor Dostoevsky",
		publisher = "FSG Adult",
		isbn10 = "0374528373",
		isbn13 = "978-0374528379",
		description = "The award-winning translation of Dostoevsky's last and greatest novel.",
		pages = 824,
		price = 19.95,
		weight = 635,
		dimensions = (21.2, 14.2, 3.7)
	},
	Book {
		title = "Love Come To Me",
		author = "Lisa Kleypas",
		publisher = "Signet (MM)",
		isbn10 = "0451236335",
		isbn13 = "978-0451236333",
		description = "",
		pages = 400,
		price = 8.99,
		weight = 200,
		dimensions = (17.2, 10.8, 2.8)
	},
	Book {
		title = "Bed of Roses",
		author = "Nora Roberts",
		publisher = "Penguin",
		isbn10 = "0425230074",
		isbn13 = "978-0425230077",
		description = "As little girls MacKensie, Emma, Laurel, and Parker spent hours acting out their perfect make believe \"I do\" moments. Years later their fantasies become reality when they start their own wedding planning company to make every woman's dream day come true. With perfect flowers, delicious desserts, and joyful moments captured on film, Nora Roberts's Bride Quartet shares each woman's emotionally magical journey to romance.",
		pages = 352,
		price = 20.00,
		weight = 363,
		dimensions = (20.8, 14.3, 2.5)
	},
	Book {
		title = "The Rose Garden",
		author = "Susanna Kearsley",
		publisher = "Allison & Busby",
		isbn10 = "0749009519",
		isbn13 = "978-0749009519",
		description = "When Eva's film star sister Catrina dies, she leaves California and returns to Trelowarth, Cornwall, where they spent their childhood summers, to scatter Catrina's ashes and thus return her to the place where she belongs. But in doing so Eva must confront ghosts from her own past, as well as those from a time long before her own. For the house where she so often stayed as a child is home not only to her old friends the Hallets, but also to the people who had lived there in the eighteenth century. Eva finds herself able to see and talk to these people, and she falls for Daniel Butler, a man who lived and died long before she herself was born. ",
		pages = 288,
		price = 19.95,
		weight = 567,
		dimensions = (21.3, 13.5, 4.3)
	},
	Book {
		title = "Magic Study",
		author = "Maria V. Snyder",
		publisher = "Mira",
		isbn10 = "0778327124",
		isbn13 = "978-0778327127",
		description = "Family betrayal, a power-mad serial killer and a potential diplomatic crisis threaten the independent-minded heroine of Snyder's fine sequel to Poison Study (2005). With the overthrow of the royal family of Ixia, 20-year-old Yelena Zaltana, who was kidnapped as a child by the evil magician Mogkan, is now free to return home to Sitia. Her reunion with the family she hasn't seen in 14 years palls when her brother spreads rumors she's actually a spy from Ixia. At the Magician's Citadel, where Yelena enrolls to hone her prodigious magical talents, her powers raise concern that she might be a rare, powerful Soulfinder. Then a string of ugly murders reveals the presence of a rogue magician in the area. As Yelena joins the hunt for the killer, complications grow with the arrival of a diplomatic mission from Ixia—including her lover, Valek, a notorious spy and assassin, sure to be executed if anyone sees through his disguise. Snyder's lively, charming mix of romance and fantasy is sure to gain her new fans.",
		pages = 448,
		price = 9.99,
		weight = 322,
		dimensions = (20.1, 13, 2.9)
	},
	Book {
		title = "The Beach Club",
		author = "Elin Hilderbrand",
		publisher = "St. Martin's Griffin",
		isbn10 = "0312382421",
		isbn13 = "978-0312382421",
		description = "Gorgeous Nantucket is an island where memories are made, friendships begun, passions ignited. Now, during one unforgettable summer, the exclusive Nantucket Beach Club and Hotel will shape the fates of the men and women who walk through its doors... Mack Petersen escaped the past and started over in a hotel that has become his life.  This summer his secrets can't stay hidden. Love O'Donnell, a glamorous Aspen native, takes a job at the Beach Club to implement her life plan--to find a man to get her pregnant. Vance Robbins has his African-American pride and festering resentments. This season, a gun and a woman offer him a chance to get even with the man he hates most. Cecily Elliott, the owner's daughter, wild and beautiful at eighteen, is about to do something to break her parents' hearts. And Lacey Gardner, the Grande Dame of the Beach Club for 45 years, knows about desperate desire--and about the storm coming that will change everything.",
		pages = 368,
		price = 16.99,
		weight = 181,
		dimensions = (20.8, 14.1, 2.5)
	},
	Book {
		title = "The Guardian",
		author = "Nicholas Sparks",
		publisher = "Grand Central Publishing",
		isbn10 = "0446613436",
		isbn13 = "978-0446613439",
		description = "Julie Barenson's young husband left her two unexpected gifts before he died-a Great Dane puppy named Singer and the promise that he would always be watching over her. Now, four years have passed. Still living in the small town of Swansboro, North Carolina, twenty-nine-year-old Julie is emotionally ready to make a commitment to someone again. But who? Should it be Richard Franklin, the handsome, sophisticated engineer who treats her like a queen? Or Mike Harris, the down-to-earth nice guy who was her husband's best friend? Choosing one of them should bring her more happiness than she's had in years. Instead, Julie is soon fighting for her life in a nightmare spawned by a chilling deception and jealousy so poisonous that it has become a murderous desire...",
		pages = 512,
		price = 9.50,
		weight = 249,
		dimensions = (10.8, 2.9, 17.1)
	},
	Book {
		title = "Wuthering Heights",
		author = "Emily Bronte",
		publisher = "Penguin Classic",
		isbn10 = "0141040351",
		isbn13 = "978-0141040356",
		description = "Wuthering Heights, first published in 1847, the year before the author's death at the age of thirty, endures today as perhaps the most powerful and intensely original novel in the English language. The epic story of Catherine and Heathcliff plays out against the dramatic backdrop of the wild English moors, and presents an astonishing metaphysical vision of fate and obsession, passion and revenge. \"Only Emily Brontë,\" V. S. Pritchett said, \"exposes her imagination to the dark spirit.\" And Virginia Woolf wrote, \"Hers...is the rarest of all powers. She could free life from its dependence on facts...by speaking of the moor make the wind blow and the thunder roar.\" This edition also includes Charlotte Brontë's original Introduction.",
		pages = 400,
		price = 25.00,
		weight = 522,
		dimensions = (20.5, 13.4, 3.6)
	},
	Book {
		title = "The Time Traveler's Wife",
		author = "Audrey Niffenegger",
		publisher = "Vintage Canada",
		isbn10 = "0676976336",
		isbn13 = "978-0676976335",
		description = "Audrey Niffenegger's innovative debut, The Time Traveler's Wife, is the story of Clare, a beautiful art student, and Henry, an adventuresome librarian, who have known each other since Clare was six and Henry was thirty-six, and were married when Clare was twenty-three and Henry thirty-one. Impossible but true, because Henry finds himself periodically displaced in time, pulled to moments of emotional gravity from his life, past and future. His disappearances are spontaneous, his experiences unpredictable, alternately harrowing and amusing.",
		pages = 560,
		price = 22.00,
		weight = 340,
		dimensions = (19.8, 12.4, 3)
	},
	Book {
		title = "The Princess Bride: S. Morgenstern's Classic Tale of True Love and High Adventure",
		author = "William Goldman",
		publisher = "Harcour",
		isbn10 = "0156035154",
		isbn13 = "978-0156035156",
		description = "William Goldmans beloved novel has sold over one million copies. A movie, released twenty years ago, perfectly captured the spirit of the book and has introduced new fans to its pages ever since. In 1941 a young boy lies bedridden from pneumonia. His perpetually disheveled and unattractive father, an immigrant from Florin with terribly broken English, shuffles into his bedroom carrying a book. The boy wants to know if it has any sports. His father says, \"Fencing. Fighting. Torture. Poison. True love. Hate. Revenge. Giants. Hunters. Bad men. Good men. Beautifulest ladies. Snakes. Spiders. Beasts of all natures and descriptions. Pain. Death. Brave men. Coward men. Strongest men. Chases. Escapes. Lies. Truths. Passions. Miracles.\" And the little boy, though he doesnt know it, is about to change forever. As Goldman says, \"What happened was just this. I got hooked on the story.\" And coming generations of readers will, too.",
		pages = 432,
		price = 16.95,
		weight = 431,
		dimensions = (20.4, 13.4, 2.9)
	},
	Book {
		title = "Perfect",
		author = "Judith McNaught",
		publisher = "Pocket Books",
		isbn10 = "067179552X",
		isbn13 = "978-0671795528",
		description = "A rootless foster child, Julie Mathison had blossomed under the love showered upon her by her adoptive family. Now a lovely and vivacious young woman, she was a respected teacher in her small Texas town, and she passionately lived her ideals. Julie was determined to give back all the kindness she'd received; nothing and no one would ever shatter the perfect life she had fashioned.",
		pages = 516,
		price = 30.00,
		weight = 907,
		dimensions = (23.9, 15.7, 3.8)
	},
	Book {
		title = "I've Got Your Number: A Novel",
		author = "Sophie Kinsella",
		publisher = "The Dial Press",
		isbn10 = "0385342063",
		isbn13 = "978-0385342063",
		description = "Poppy Wyatt has never felt luckier. She is about to marry her ideal man, Magnus Tavish, but in one afternoon her “happily ever after” begins to fall apart. Not only has she lost her engagement ring in a hotel fire drill but in the panic that follows, her phone is stolen. As she paces shakily around the lobby, she spots an abandoned phone in a trash can. Finders keepers! Now she can leave a number for the hotel to contact her when they find her ring. Perfect!",
		pages = 448,
		price = 31.00,
		weight = 535,
		dimensions = (14.9, 3.8, 21.7)
	},
	Book {
		title = "Dark Harvest",
		author = "Lynda Hilburn",
		publisher = "Medallion",
		isbn10 = "193383661X",
		isbn13 = "978-1933836614",
		description = "Still adjusting to her new role as an expert on all things paranormal — as well as her unexpected notoriety and new clientele — she schedules what she believes is simply another radio interview. She couldn’t be more mistaken. Not only does the radio host behave very strangely, but an ominous, on-air call turns Kismet’s world upside-down- again.",
		pages = 400,
		price = 126.27,
		weight = 408,
		dimensions = (20.4, 16.7, 3)
	},
	Book {
		title = "The Black Knight",
		author = "Connie Mason",
		publisher = "Dorchester Publishing",
		isbn10 = "1428511717",
		isbn13 = "978-1428511712",
		description = "In his stark black armor he looked lethal and sinister, every bit as dangerous as his name implied. He was a man renowned for his courage and strength, for his prowess with women, and for his ruthless skill in combat. But when he saw Raven of Chirk, he could barely contain his embroiled emotions.",
		pages = 330,
		price = 84.13,
		weight = 408,
		dimensions = (20.3, 13.3, 1.9)
	},
	Book {
		title = "A Girl of the Limberlost",
		author = "Gene Stratton-Porter",
		publisher = "BiblioLife ",
		isbn10 = "0554334577",
		isbn13 = "978-0554334578",
		description = "This is a pre-1923 historical reproduction that was curated for quality. Quality assurance was conducted on each of these books in an attempt to remove books with imperfections introduced by the digitization process. Though we have made best efforts - the books may have occasional errors that do not impede the reading experience. We believe this work is culturally important and have elected to bring the book back into print as part of our continuing commitment to the preservation of printed works worldwide.",
		pages = 364,
		price = 36.66,
		weight = 590,
		dimensions = (23.4, 15.6, 2.1)
	},
	Book {
		title = "Kenyon Dark-Hunter Boxed Set",
		author = "Sherrilyn Kenyon",
		publisher = "St. Martin's Paperbacks",
		isbn10 = "0312537832",
		isbn13 = "978-0312537838",
		description = "Five Dark-Hunter stories in one terrific set! From the #1 New York Times bestselling author Sherrilyn Kenyon comes the Dark-Hunter Boxed set, containing one copy each of the Dark-Hunter novels, Night Pleasures, Night Embrace, Dance with the Devil, Kiss of the Night, and Night Play.",
		pages = 4000,
		price = 49.95,
		weight = 998,
		dimensions = (16, 16.4, 9.4)
	},
	Book {
		title = "Lolita",
		author = "Vladimir Nabokov",
		publisher = "Everyman's Library",
		isbn10 = "0679410430",
		isbn13 = "978-0679410430",
		description = "When it was published in 1955, Lolita immediately became a cause célèbre because of the freedom and sophistication with which it handled the unusual erotic predilections of its protagonist. But Vladimir Nabokov's wise, ironic, elegant masterpiece owes its stature as one of the twentieth century's novels of record not to the controversy its material aroused but to its author's use of that material to tell a love story almost shocking in its beauty and tenderness. Awe and exhilaration–along with heartbreak and mordant wit–abound in this account of the aging Humbert Humbert's obsessive, devouring, and doomed passion for the nymphet Dolores Haze. Lolita is also the story of a hypercivilized European colliding with the cheerful barbarism of postwar America, but most of all, it is a meditation on love–love as outrage and hallucination, madness and transformation.",
		pages = 376,
		price = 26.95,
		weight = 476,
		dimensions = (13.2, 2.9, 20.9)
	},
	Book {
		title = "Resurrecting Midnight",
		author = "Eric Jerome Dickey",
		publisher = "Dutton",
		isbn10 = "0525950575",
		isbn13 = "978-0525950578",
		description = "After nearly losing his life in Antigua during a mission that went terribly wrong, Gideon trusts no one. But when a former lover and grifter, Arizona, resurfaces in need of his skills, she reminds him he was indebted to a man who had once saved his life: the son of the legendary con-man Scamz. Gideon is forced to take on an assignment which will lead him to Argentina in pursuit of a briefcase containing one part of a larger puzzle. The \"package\" contains material that another group of assassins – the Four Horsemen of the Apocalypse – will kill to obtain and protect. One of the leaders of the Four Horsemen has a connection to Gideon that neither man is aware of -- a connection that will be exposed when they meet face-to-face and gun-to-gun. Each member of The Four Horsemen is a world-class killer, each with a dark and dangerous past, and nothing will stop that team of renegades from completing their mission.",
		pages = 400,
		price = 33.50,
		weight = 726,
		dimensions = (24.1, 16.3, 3.8)
	},
	Book {
		title = "Darker After Midnight: A Midnight Breed Novel",
		author = "Lara Adrian",
		publisher = "Delacorte Press",
		isbn10 = "034553087X",
		isbn13 = "978-0345530875",
		description = "In the dark of night, a blood war escalates within the hidden world of the Breed. After existing in secret for many long centuries, maintaining a fragile peace with the humans who walk beside them unaware, a single act of retaliation has put the entire vampire nation at risk of discovery. It falls to the Order—a cadre of Breed warriors pledged to protect their own and humankind alike—to stop Dragos, the power-mad vampire at the center of the conflict, before his push for domination can explode into catastrophe.",
		pages = 384,
		price = 27.00,
		weight = 590,
		dimensions = (23.6, 15.5, 3.6)
	}]

fantasyScienceFiction = [
	Book {
		title = "Shadows in Flight",
		author = "Orson Scott Card",
		publisher = "Tor Books",
		isbn10 = "0765332000",
		isbn13 = "978-0765332004",
		description = "At the end of Shadow of the Giant, Bean flees to the stars with three of his children--the three who share the engineered genes that gave him both hyper-intelligence and a short, cruel physical life. The time dilation granted by the speed of their travel gives Earth’s scientists generations to seek a cure, to no avail. In time, they are forgotten--a fading ansible signal speaking of events lost to Earth’s history. But the Delphikis are about to make a discovery that will let them save themselves, and perhaps all of humanity in days to come.",
		pages = 240,
		price = 24.99,
		weight = 272,
		dimensions = (21.3, 15, 2.3)
	},
	Book {
		title = "A Feast for Crows: A Song of Ice and Fire: Book Four",
		author = "George R.R. Martin",
		publisher = "Bantam",
		isbn10 = "055358202X",
		isbn13 = "978-0553582024",
		description = "Few books have captivated the imagination and won the devotion and praise of readers and critics everywhere as has George R. R. Martin’s monumental epic cycle of high fantasy. Now, in A Feast for Crows, Martin delivers the long-awaited fourth book of his landmark series, as a kingdom torn asunder finds itself at last on the brink of peace . . . only to be launched on an even more terrifying course of destruction.",
		pages = 1104,
		price = 10.99,
		weight = 340,
		dimensions = (10.6, 3.8, 17.4)
	},
	Book {
		title = "Batman: The Dark Knight Returns",
		author = "Frank Miller",
		publisher = "DC Comics",
		isbn10 = "1563893428",
		isbn13 = "978-1563893421",
		description = "If any comic has a claim to have truly reinvigorated the genre, then The Dark Knight Returns by Frank Miller--known also for his excellent Sin City series and his superb rendering of the blind superhero Daredevil--is probably the top contender. Batman represented all that was wrong in comics and Miller set himself a tough task taking on the camp crusader and turning this laughable, innocuous children's cartoon character into a hero for our times. The great Alan Moore (V for Vendetta, Swamp Thing, the arguably peerless Watchmen) argued that only someone of Miller's stature could have done this. Batman is a character known well beyond the confines of the comic world (as are his retinue) and so reinventing him, while keeping his limiting core essentials intact, was a huge task.Miller went far beyond the call of duty. The Dark Knight is a success on every level. Firstly it does keep the core elements of the Batman myth intact, with Robin, Alfred the butler, Commissioner Gordon, and the old roster of villains, present yet brilliantly subverted. Secondly the artwork is fantastic--detailed, sometimes claustrophobic, psychotic. Lastly it's a great story: Gotham City is a hell on earth, street gangs roam but there are no heroes. Decay is ubiquitous. Where is a hero to save Gotham? It is 10 years since the last recorded sighting of the Batman. And things have got worse than ever. Bruce Wayne is close to being a broken man but something is keeping him sane: the need to see change and the belief that he can orchestrate some of that change. Batman is back. The Dark Knight has returned. Awesome.",
		pages = 224,
		price = 16.99,
		weight = 612,
		dimensions = (16.8, 1, 25.7)
	},
	Book {
		title = "Star Wars: Darth Plagueis",
		author = "James Luceno",
		publisher = "LucasBooks",
		isbn10 = "034551128X",
		isbn13 = "978-0345511287",
		description = "Darth Plagueis: one of the most brilliant Sith Lords who ever lived. Possessing power is all he desires. Losing it is the only thing he fears. As an apprentice, he embraces the ruthless ways of the Sith. And when the time is right, he destroys his Master—but vows never to suffer the same fate. For like no other disciple of the dark side, Darth Plagueis learns to command the ultimate power . . . over life and death.",
		pages = 400,
		price = 29.00,
		weight = 621,
		dimensions = (16.3, 3.4, 24.3)
	},
	Book {
		title = "Wind Through the Keyhole, The",
		author = "Stephen King",
		publisher = "Simon & Schuster Canada",
		isbn10 = "1451658907",
		isbn13 = "978-1451658903",
		description = "For those discovering the epic bestselling Dark Tower series for the first time—and for its legions of dedicated fans—an immensely satisfying stand-alone novel and perfect introduction to the series.Beginning in 1974, gaining momentum in the 1980s and coming to a thrilling conclusion when the last three novels were published in 2003-2004, the Dark Tower epic fantasy saga stands as Stephen King’s most beguiling achievement. It has been the basis for a long-running Marvel comic series.",
		pages = 320,
		price = 29.99,
		weight = 0,
		dimensions = (0, 0, 0)
	},
	Book {
		title = "A Storm of Swords: A Song of Ice and Fire: Book Three",
		author = "George R.R. Martin",
		publisher = "Bantam",
		isbn10 = "143914964X",
		isbn13 = "978-1439149645",
		description = "Here is the third volume in George R. R. Martin’s magnificent cycle of novels that includes A Game of Thrones and A Clash of Kings. As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin’s stunning series is destined to stand as one of the great achievements of imaginative fiction.",
		pages = 1216,
		price = 9.99,
		weight = 499,
		dimensions = (10.7, 4.3, 17.5)
	},
	Book {
		title = "The Walking Dead Volume 4: The Hearts Desire",
		author = "Robert Kirkman",
		publisher = "Image Comics",
		isbn10 = "1582405301",
		isbn13 = "978-1582405308",
		description = "Life in the prison starts to get interesting for Rick Grimes and the rest of our survivors. Relationships heat up, fizzle out, and change entirely almost overnight. By the end of this volume, relationships between key characters are radically changed, setting the stage for future events in TheWalking Dead. Reprint Edition",
		pages = 136,
		price = 18.99,
		weight = 318,
		dimensions = (26, 16.9, 0.7)
	},
	Book {
		title = "Pathfinder Roleplaying Game: Bestiary 3",
		author = "Jason Bulmahn",
		publisher = "Paizo Publishing",
		isbn10 = "1601253788",
		isbn13 = "978-1601253781",
		description = "Unleash a world of monsters! Bestiary 3 presents hundreds of new creatures for use in the Pathfinder Roleplaying Game. Within this collection of creatures you'll find grave knights and savage cyclopes, kappa and colossal kaiju, clockwork killers, mysterious sphinxes, imperial dragons, and so much more! A companion to the Pathfinder RPG Core Rulebook and Pathfinder RPG Bestiary, Bestiary 3 features more than 300 different monsters, including new creatures drawn from the best-known beasts of legend, literature, and Pathfinder RPG adventures, hordes of new templates and variants, numerous lists of monsters to aid in navigation, expanded universal monster rules to simplify special attacks, defenses, and qualities, and new familiars, animal companions, and other allies.",
		pages = 320,
		price = 49.99,
		weight = 1100,
		dimensions = (27.7, 21.6, 2.3)
	},
	Book {
		title = "Batman: Year One",
		author = "Frank Miller",
		publisher = "DC Comics",
		isbn10 = "1401207529",
		isbn13 = "978-1401207526",
		description = "Whether you grew up reading Batman comics, watched the campy television show, or eagerly await each new movie, this is the book for you. A retelling of the events that led to Bruce Wayne's becoming Batman, this book combines Frank Miller's tight film-noir writing with David Mazucchelli's solid artwork.",
		pages = 144,
		price = 16.99,
		weight = 363,
		dimensions = (16.9, 0.7, 25.7)
	},
	Book {
		title = "Sisterhood of Dune",
		author = "Brian Herbert",
		publisher = "Tor Books",
		isbn10 = "0765322730",
		isbn13 = "978-0765322739",
		description = "It is eighty-three years after the last of the thinking machines were destroyed in the Battle of Corrin, after Faykan Butler took the name of Corrino and established himself as the first Emperor of a new Imperium. Great changes are brewing that will shape and twist all of humankind. ",
		pages = 496,
		price = 31.99,
		weight = 680,
		dimensions = (23.9, 15.7, 4.1)
	},
	Book {
		title = "A Game of Thrones: A Song of Ice and Fire: Book One",
		author = "George R.R. Martin",
		publisher = "Bantam",
		isbn10 = "0553573403",
		isbn13 = "978-0553573404",
		description = "Here is the first volume in George R. R. Martin’s magnificent cycle of novels that includes A Clash of Kings and A Storm of Swords. As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin’s stunning series is destined to stand as one of the great achievements of imaginative fiction.",
		pages = 864,
		price = 9.99,
		weight = 798,
		dimensions = (10.6, 3.5, 17.4)
	},
	Book {
		title = "Art of the Mass Effect Universe",
		author = "Various",
		publisher = "Dark Horse",
		isbn10 = "1595827684",
		isbn13 = "978-1595827685",
		description = "The Mass Effect series is a groundbreaking epic that has immersed gamers in one of science fiction''s richest universes. Now BioWare and Dark Horse are proud to invite fans deeper than ever into the Mass Effect saga with The Art of the Mass Effect Universe! Featuring concept art and commentary by BioWare on the games'' characters, locations, vehicles, weapons, and more",
		pages = 184,
		price = 44.00,
		weight = 0,
		dimensions = (0, 0, 0)
	},
	Book {
		title = "Do Androids Dream of Electric Sheep?",
		author = "Philip K. Dick",
		publisher = "Del Rey",
		isbn10 = "0345404475",
		isbn13 = "978-0345404473",
		description = "By 2021, the World War had killed millions, driving entire species into extinction and sending mankind off-planet. Those who remained coveted any living creature, and for people who couldn't afford one, companies built incredibly realistic simulacrae: horses, birds, cats, sheep. . . They even built humans.",
		pages = 256,
		price = 16.50,
		weight = 249,
		dimensions = (13, 1.3, 20.2)
	},
	Book {
		title = "V for Vendetta New (New Edition TPB)",
		author = "Alan Moore",
		publisher = "Vertigo",
		isbn10 = "140120841X",
		isbn13 = "978-1401208417",
		description = "",
		pages = 296,
		price = 22.99,
		weight = 422,
		dimensions = (16.9, 1.7, 25.8)
	},
	Book {
		title = "Slaughterhouse-Five",
		author = "Kurt Vonnegut Jr.",
		publisher = "Dell",
		isbn10 = "0440180295",
		isbn13 = "978-0440180296",
		description = "",
		pages = 224,
		price = 9.99,
		weight = 113,
		dimensions = (10.6, 1.5, 17.5)
	},
	Book {
		title = "Atlas Shrugged: 50th anniversary",
		author = "Ayn Rand",
		publisher = "Penguin",
		isbn10 = "0451191145",
		isbn13 = "978-0451191144",
		description = "In a world without political freedom, personal freedom and precious little faith in anything comes a mysterious man in a white porcelain mask who fights political oppressors through terrorism and seemingly absurd acts. It's a gripping tale of the blurred lines between ideological good and evil.",
		pages = 1088,
		price = 12.50,
		weight = 476,
		dimensions = (17.5, 10.4, 4.3)
	},
	Book {
		title = "Discovery of Witches",
		author = "Deborah Harkness",
		publisher = "Penguin",
		isbn10 = "0143119680",
		isbn13 = "978-0143119685",
		description = "It all begins with a lost manuscript, a reluctant witch, and 1,500-year-old vampire. Dr. Diana Bishop has a really good reason for refusing to do magic: she is a direct descendant of the first woman executed in the Salem Witch Trials, and her parents cautioned her be discreet about her talents before they were murdered, presumably for having \"too much power.\" So it is purely by accident that Diana unlocks an enchanted long-lost manuscript (a book that all manner of supernatural creatures believe to hold the story of all origins and the secret of immortality) at the Bodleian Library at Oxford, and finds herself in a race to prevent an interspecies war. A sparkling debut written by a historian and self-proclaimed oenophile, A Discovery of Witches is heady mix of history and magic, mythology and love (cue the aforementioned vampire!), making for a luxurious, intoxicating, one-sitting read.",
		pages = 592,
		price = 17.00,
		weight = 476,
		dimensions = (21.3, 14, 3.6)
	},
	Book {
		title = "A Clash of Kings: A Song of Ice and Fire: Book Two",
		author = "George R.R. Martin",
		publisher = "Bantam",
		isbn10 = "0553579908",
		isbn13 = "978-0553579901",
		description = "In this eagerly awaited sequel to A Game of Thrones, George R. R. Martin has created a work of unsurpassed vision, power, and imagination. A Clash of Kings transports us to a world of revelry and revenge, wizardry and warfare unlike any you have ever experienced.",
		pages = 1040,
		price = 9.99,
		weight = 522,
		dimensions = (18, 12.1, 4.4)
	},
	Book {
		title = "Star Wars: The Old Republic: Revan",
		author = "Drew Karpyshyn",
		publisher = "LucasBooks",
		isbn10 = "0345511344",
		isbn13 = "978-0345511348",
		description = "Revan: hero, traitor, conqueror, villain, savior. A Jedi who left Coruscant to defeat Mandalorians—and returned a disciple of the dark side, bent on destroying the Republic. The Jedi Council gave Revan his life back, but the price of redemption was high. His memories have been erased. All that’s left are nightmares—and deep, abiding fear.",
		pages = 320,
		price = 31.00,
		weight = 159,
		dimensions = (16, 2.8, 24.2)
	},
	Book {
		title = "Ready Player One",
		author = "Ernest Cline",
		publisher = "Crown",
		isbn10 = "030788743X",
		isbn13 = "978-0307887436",
		description = "At once wildly original and stuffed with irresistible nostalgia, READY PLAYER ONE is a spectacularly genre-busting, ambitious, and charming debut—part quest novel, part love story, and part virtual space opera set in a universe where spell-slinging mages battle giant Japanese robots, entire planets are inspired by Blade Runner, and flying DeLoreans achieve light speed.",
		pages = 384,
		price = 25.00,
		weight = 703,
		dimensions = (16.4, 3.5, 24.3)
	},
	Book {
		title = "Batman: Killing Joke (DELUXE)",
		author = "Alan Moore",
		publisher = "DC Comics",
		isbn10 = "1401216676",
		isbn13 = "978-1401216672",
		description = "The Killing Joke, one of my favorite Batman stories ever, stirred a bit of controversy because the story involves the Joker brutally, pointlessly shooting Commissioner Gordon's daughter in the spine. This is a no-holds-barred take on a truly insane criminal mind, masterfully written by British comics writer Alan Moore. The art by Brian Bolland is so appealing that his depiction of the Joker became a standard and was imitated by many artists to follow.",
		pages = 64,
		price = 19.99,
		weight = 431,
		dimensions = (18.7, 1.2, 28.4)
	},
	Book {
		title = "Oryx and Crake: A Novel",
		author = "Margaret Atwood",
		publisher = "Seal Books",
		isbn10 = "0770429351",
		isbn13 = "978-0770429355",
		description = "The narrator of Atwood's riveting novel calls himself Snowman. When the story opens, he is sleeping in a tree, wearing an old bedsheet, mourning the loss of his beloved Oryx and his best friend Crake, and slowly starving to death. He searches for supplies in a wasteland where insects proliferate and pigoons and wolvogs ravage the pleeblands, where ordinary people once lived, and the Compounds that sheltered the extraordinary. As he tries to piece together what has taken place, the narrative shifts to decades earlier. How did everything fall apart so quickly? Why is he left with nothing but his haunting memories? Alone except for the green-eyed Children of Crake, who think of him as a kind of monster, he explores the answers to these questions in the double journey he takes - into his own past, and back to Crake's high-tech bubble-dome, where the Paradice Project unfolded and the world came to grief.",
		pages = 464,
		price = 11.99,
		weight = 23,
		dimensions = (17.3, 10.2, 3.8)
	}]

{--

,
	Book {
		title = ,
		author = ,
		publisher = ,
		isbn10 = ,
		isbn13 = ,
		pages = ,
		price = ,
		weight = ,
		dimensions = (, , )
	}

--}

fields = "(title, author, publisher, isbn_10, isbn_13, genre, description, number_of_pages, weight, dimensions, thumbnail, cover, list_price, sale_price, wholesale_price)"

generate :: Genre -> Book -> String
generate genre book = concat [
	"INSERT INTO book ",
	fields,
	" VALUES(", 
	List.intercalate ", " [
		string (title book), 
		string (author book),
		string (publisher book),
		string (isbn10 book),
		string (isbn13 book),
		string genre,
		string (description book),
		show (pages book),
		show (weight book),
		string (show (dimensions book)),
		string (thumbnail book),
		string (cover book),
		show (listPrice book),
		show (salePrice book),
		show (wholesalePrice book)],
	");"]
	
string s = "'" ++ (s >>= special) ++ "'"
	where	special '\\' = ['\\', '\\']
		special '\'' = ['\\', '\'']
		special '\n' = ['\\', 'n']
		special '\t' = ['\\', 't']
		special '’' = ['\\', '’']
		special c = [c]

statements = do
	(genre, books) <- catalog
	book <- books
	return (generate genre book)

main = writeFile "books.sql" (intercalate "\n" statements ++ "\n")
	











