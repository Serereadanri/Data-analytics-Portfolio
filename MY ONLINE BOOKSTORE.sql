CREATE DATABASE ONLINE_BOOKSTORE

USE ONLINE_BOOKSTORE

CREATE SCHEMA BOOK

CREATE TABLE BOOK.BOOKS
(
BOOK_ID INT NOT NULL,
TITLE VARCHAR (100) NOT NULL,
AUTHOR VARCHAR(50) NOT NULL,
CATEGORY VARCHAR(50) NOT NULL,
PRICE DECIMAL(10,2) NULL,
STOCK_STATUS VARCHAR(50) NOT NULL,
COPIES_LEFT INT NULL,
BOOK_LENGTH INT NULL,
EDITION VARCHAR(50) NULL,
PUBLICATION VARCHAR(50) NULL,
WISHED_USERS INT NULL,
DISCOUNT_OFFER CHAR NULL,
RATINGS INT NULL,
REVIEWS INT NULL
)

CREATE SCHEMA ORDERS

CREATE TABLE ORDERS.ORDERS
(ORDER_ID INT NOT NULL,
CUSTOMER_ID INT NOT NULL,
BOOK_ID INT NOT NULL,
ORDER_DATE DATE NOT NULL,
QUANTITY INT NOT NULL,
TOTAL_AMOUNT DECIMAL(10,2) NOT NULL
)

CREATE SCHEMA CUSTOMER

CREATE TABLE CUSTOMER.CUSTOMERS
(CUSTOMER_ID INT NOT NULL,
CUSTOMER_NAME VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PHONE_NUMBER INT NOT NULL,
CITY VARCHAR(50) NULL,
COUNTRY VARCHAR(50) NULL
)

---------ASSIGNING PRIMARY KEYS
ALTER TABLE [BOOK].[BOOKS]
ADD CONSTRAINT PK_BKID PRIMARY KEY ([BOOK_ID]);

ALTER TABLE [CUSTOMER].[CUSTOMERS]
ADD CONSTRAINT PK_CUSTMID PRIMARY KEY ([CUSTOMER_ID])

ALTER TABLE [ORDERS].[ORDERS]
ADD CONSTRAINT PK_ORDERID PRIMARY KEY ([ORDER_ID])


-----------CHECK CONSTRAINTS
-------- ALL EMAILS MUST HAVE THE @ SYMBOL
ALTER TABLE [CUSTOMER].[CUSTOMERS]
ADD CONSTRAINT CHK_EMAIL CHECK( [EMAIL] LIKE '%@%')

--- ALL PHONE NUMBES MUST BE 10 DIGITS
ALTER TABLE [CUSTOMER].[CUSTOMERS]
ADD CONSTRAINT CHK_PHONENUMBER CHECK(LEN ([PHONE_NUMBER])= 10)

-----FOREIGN KEYS
ALTER TABLE [ORDERS].[ORDERS]
ADD CONSTRAINT FK_CUSTOMID FOREIGN KEY([CUSTOMER_ID]) REFERENCES [CUSTOMER].[CUSTOMERS]([CUSTOMER_ID])

ALTER TABLE [ORDERS].[ORDERS]
ADD CONSTRAINT FK_BKID FOREIGN KEY([BOOK_ID]) REFERENCES [BOOK].[BOOKS]([BOOK_ID])

---ALL PRICES MUST BE GREATER THAN 0
ALTER TABLE [BOOK].[BOOKS]
ADD CONSTRAINT CHK_BKPRICE CHECK([PRICE]>0)

----UNIQUE CONSTRAINT
ALTER TABLE [CUSTOMER].[CUSTOMERS]
ADD CONSTRAINT UQ_EMAIL UNIQUE ([EMAIL])

---CREATING INDEX FOR ORDER DATE
CREATE INDEX IDX_ORDERDATE
ON [ORDERS].[ORDERS]([ORDER_DATE])


------ADDING AN EXTRA TABLE TO THE ORDER COLUMN
ALTER TABLE [ORDERS].[ORDERS]
ADD  ORDER_STATUS CHAR NOT NULL

-----CHANGING THE CAPACITY OF A VARCHAR COLUMN
ALTER TABLE [BOOK].[BOOKS]
ALTER COLUMN AUTHOR VARCHAR (255) 

ALTER TABLE [BOOK].[BOOKS]
ALTER COLUMN [DISCOUNT_OFFER] VARCHAR (255) 

ALTER TABLE[ORDERS].[ORDERS]
ALTER COLUMN [ORDER_STATUS]VARCHAR (255) 

------USING PENDING AS THE DEFAULT STAEMENT IF NO VALUE IS ENTERED
ALTER TABLE[ORDERS].[ORDERS]
ADD CONSTRAINT   DF_ORDER_STATUS DEFAULT  'PENDING' FOR [ORDER_STATUS]



-----INSERTING VALUES
INSERT INTO [BOOK].[BOOKS]([BOOK_ID],[TITLE],[AUTHOR],[CATEGORY],[PRICE],[STOCK_STATUS],[COPIES_LEFT],[BOOK_LENGTH],[EDITION],[PUBLICATION],[WISHED_USERS],[DISCOUNT_OFFER],[RATINGS],[REVIEWS])
VALUES
													
(169 , 	 ' Sapiens A Brief History Of Humankind ' ,	 ' Yuval Noah Harari ' ,	 ' History and Tradition ' ,	21.34,	 ' In Stock ' ,	4,	498,	 ' 1st Published ' ,	 ' Vintage Books (India) ' ,	386,	 ' Yes ' ,	39,	16),
(301 , 	 ' The Intelligent Investor ' ,	 ' Benjamin Graham ' ,	 '  Business, Investment and Economics ' ,	35.8,	 ' In Stock ' ,	6,	640,	 ' 8th Impression ' ,	 ' Harpercollins Publishers (India) ' ,	531,	 ' Yes ' ,	30,	25),
(261 , 	 ' Madinah Arabic Reader 1 ' ,	 ' Dr. V. Abdur Rahim ' ,	 ' Islamic Books ' ,	15.75,	 ' In Stock ' ,	21,	80,	 ' 1st Edition 2011 ' ,	 ' Goodword Books (India) ' ,	0,	 ' Yes ' ,	6,	3),
(343 , 	 ' The Quran ' ,	 ' M.A.S. Abdel Haleem (Translator) ' ,	 ' Islamic Books ' ,	43.52,	 ' In Stock ' ,	38,	512,	 ' Reissue Edition ' ,	 ' Oxford University Press, USA ' ,	0,	 ' Yes ' ,	19,	5),
(431 , 	 ' Let Us C, 19th Edition ' ,	 ' Yashavant Kanetkar ' ,	 ' Computer Science & Engineering ' ,	10.95,	 ' In Stock ' ,	18,	492,	 ' 19th Edition ' ,	 ' BPB Publications (India) ' ,	0,	 ' Yes ' ,	3,	1),
(119 , 	 ' 400 Days ' ,	 ' Chetan Bhagat ' ,	 '  Novel ' ,	6.56,	 ' In Stock ' ,	58,	344,	 ' Published ' ,	 ' Westland (India) ' ,	0,	 ' Yes ' ,	9,	2),
(467 , 	 ' War And Peace ' ,	 ' Leo Tolstoy, Richard Pevear (Translator), Larissa Volokhonsky (Translator) ' ,	 '  Novel ' ,	43.63,	 ' In Stock ' ,	11,	1276,	 ' 1st Edition ' ,	 ' Vintage Classics (India) ' ,	108,	 ' Yes ' ,	9,	2),
(159 , 	 ' Ecotourism ' ,	 ' Harish Bhat , B.S. Badan ' ,	 ' Tourism and Hospitality  ' ,	48.99,	 ' Out stock ' ,	0,	345,	 ' 1st edition ' ,	 ' Commonwealth Pub. ' ,	0,	 ' No ' ,	0,	0),
(410 , 	 ' Managing Tourism and Hospitality Services ' ,	 ' Gianna Moscardo (Editor), Bruce Prideaux (Editor), Eric Laws (Editor) ' ,	 ' Tourism and Hospitality  ' ,	14.33,	 ' In Stock ' ,	3,	338,	 ' 1st Edition ' ,	 ' Cabi Publishing (India) ' ,	0,	 ' Yes ' ,	1,	0),
(122 , 	 ' Tata Stories ' ,	 ' Harish Bhat ' ,	 ' Foreign Language Books ' ,	24.63,	 ' In Stock ' ,	5,	202,	 ' 1st Edition ' ,	 ' Portfolio Penguin (India) ' ,	0,	 ' Yes ' ,	2,	0),
(206 , 	 ' Elon Musk ' ,	 ' Walter Isaacson ' ,	 ' Biographies, Memories & Interviews ' ,	35.95,	 ' In Stock ' ,	2,	688,	 ' 3RD Edition ' ,	 ' Simon & Schuster Ltd (India) ' ,	0,	 ' Yes ' ,	2,	0),
(3 , 	 ' How Harsh Mariwala ?Groomed? Marico ' ,	 ' R. Gopalakrishnan , M. Suresh Rao ' ,	 ' Business, Investment and Economics ' ,	27.43,	 ' In Stock ' ,	2,	146,	 ' 1st Edition ' ,	 ' Rupa Publications India ' ,	0,	 ' Yes ' ,	1,	0),
(180 , 	 ' TataLog Eight Modern Stories from a Timeless Institution ' ,	 ' Harish Bhat ' ,	 ' Business, Investment and Economics ' ,	14.04,	 ' In Stock ' ,	5,	224,	 ' Edition ' ,	 ' Penguin Business (India) ' ,	0,	 ' Yes ' ,	3,	0),
(319 , 	 ' Good Economics for Hard Times ' ,	 ' Abhijit V. Banerjee , Esther Duflo ' ,	 ' Business, Investment and Economics ' ,	6.04,	 ' In Stock ' ,	8,	402,	 ' Edition ' ,	 ' Juggernaut (India) ' ,	0,	 ' Yes ' ,	5,	4),
(479 , 	 ' The Wealth of Nations : Fingerprint ' ,	 ' Adam Smith ' ,	 ' Business, Investment and Economics ' ,	23.83,	 ' In Stock ' ,	5,	1144,	 ' 1st Published ' ,	 ' Fingerprint Publishing (India) ' ,	0,	 ' Yes ' ,	0,	0),
(196 , 	 ' Train to Pakistan ' ,	 ' Khushwant Singh ' ,	 ' Novel ' ,	10.07,	 ' In Stock ' ,	4,	190,	 ' 1st Edition ' ,	 ' Penguin Books (India) ' ,	0,	 ' Yes ' ,	11,	2),
(481 , 	 ' One Hundred Years of Solitude ' ,	 ' Gabriel Garcia Marquez ' ,	 ' Novel ' ,	5.37,	 ' In Stock ' ,	7,	422,	 ' 5th Edition ' ,	 ' Penguin Books (India) ' ,	374,	 ' Yes ' ,	23,	5),
(101 , 	 ' A Thousand Splendid Suns ' ,	 ' Khaled Hosseini ' ,	 ' Novel ' ,	39.47,	 ' In Stock ' ,	8,	419,	 ' 1st Edition ' ,	 ' Bloomsbury Publishing (India) ' ,	277,	 ' Yes ' ,	27,	13),
(60 , 	 ' Ikigai ' ,	 ' Hector Garcia, Francesc Miralles ' ,	 ' Self-help and meditation ' ,	11.31,	 ' In Stock ' ,	32,	208,	 ' 1st Edition ' ,	 ' Random House UK ' ,	0,	 ' Yes ' ,	10,	4),
(67 , 	 ' Zero to One: Notes on Start Ups, or How to Build the Future ' ,	 ' Peter Thiel, Blake Masters ' ,	 ' Self-help and meditation ' ,	48.13,	 ' In Stock ' ,	13,	210,	 ' Edition ' ,	 ' Virgin Books (India) ' ,	308,	 ' Yes ' ,	13,	6),
(287 , 	 ' Atomic Habits ' ,	 ' James Clear ' ,	 ' Self-help and meditation ' ,	47.13,	 ' In Stock ' ,	9,	288,	 ' 1st Published ' ,	 ' Random House Business Books (India) ' ,	412,	 ' Yes ' ,	19,	4),
(427 , 	 ' Mein Kampf ' ,	 ' Adolf Hitler ' ,	 ' International Political Personality ' ,	39.23,	 ' In Stock ' ,	17,	560,	 ' Published ' ,	 ' Fingerprint Publishing (India) ' ,	0,	 ' Yes ' ,	17,	5),
(303 , 	 ' The Post American World And The Rise Of The Rest ' ,	 ' Fareed Zakaria ' ,	 ' International Politics ' ,	38.55,	 ' In Stock ' ,	1,	292,	 ' 1st Edition ' ,	 ' Penguin Books (India) ' ,	0,	 ' Yes ' ,	10,	2),
(192 , 	 ' The Old Man and The Sea ' ,	 ' Ernest Hemingway ' ,	 ' Novel ' ,	32.74,	 ' In Stock ' ,	0,	104,	 ' 2nd Edition ' ,	 ' Friends Book Corner ' ,	453,	 ' Yes ' ,	73,	54),
(250 , 	 ' Metamorphosis ' ,	 ' Franz Kafka, David Wyllie (Translator) ' ,	 ' Novel ' ,	8.55,	 ' In Stock ' ,	20,	100,	 ' Published ' ,	 ' Fingerprint Publishing (India) ' ,	0,	 ' Yes ' ,	29,	8),
(407 , 	 ' Animal Farm ' ,	 ' George Orwell ' ,	 ' Novel ' ,	21.05,	 ' In Stock ' ,	33,	95,	 ' 1st Edition ' ,	 ' Fingerprint Publishing (India) ' ,	384,	 ' Yes ' ,	44,	17),
(156 , 	 ' The Girl in Room 105 ' ,	 ' Chetan Bhagat ' ,	 ' Novel ' ,	42.14,	 ' In Stock ' ,	5,	308,	 ' Published ' ,	 ' Harpercollins Publishers (India) ' ,	252,	 ' Yes ' ,	36,	17),
(423 , 	 ' The Alchemist ' ,	 ' Paulo Coelho ' ,	 ' Novel ' ,	37.51,	 ' In Stock ' ,	44,	172,	 ' 1st Edition ' ,	 ' Harpercollins Publishers (India) ' ,	1470,	 ' Yes ' ,	0,	0),
(446 , 	 ' The Startup Wife ' ,	 ' Tahmima Anam ' ,	 ' Novel ' ,	31.12,	 ' In Stock ' ,	1,	304,	 ' Published ' ,	 ' Penguin Books (India) ' ,	0,	 ' Yes ' ,	4,	0),
(248 , 	 ' My Devotion ' ,	 ' Julia Kerninon, Alison Anderson ' ,	 ' Novel ' ,	30.58,	 ' In Stock ' ,	1,	272,	 ' Published ' ,	 ' Europa Editions ' ,	0,	 ' Yes ' ,	0,	0),
(279 , 	 ' How to Win Friends and Influence People ' ,	 ' Dale Carnegie ' ,	 ' Self-help and meditation ' ,	21.23,	 ' In Stock ' ,	27,	240,	 ' 1st Edition ' ,	 ' Maanu Graphics Publishers (India) ' ,	967,	 ' Yes ' ,	85,	29),
(313 , 	 ' The Power Of Positive Thinking ' ,	 ' Dr. Norman Vincent Peale ' ,	 ' Self-help and meditation ' ,	21.56,	 ' In Stock ' ,	4,	320,	 ' Edition ' ,	 ' Vermilion London (India) ' ,	528,	 ' Yes ' ,	26,	9),
(253 , 	 ' Who Moved My Cheese? ' ,	 ' Spencer Johnson ' ,	 ' Self-help and meditation ' ,	35.06,	 ' In Stock ' ,	40,	96,	 ' Published ' ,	 ' Vermilion London (India) ' ,	860,	 ' Yes ' ,	55,	25),
(146 , 	 ' Think and Grow Rich ' ,	 ' Napoleon Hill ' ,	 ' Self-help and meditation ' ,	16.49,	 ' In Stock ' ,	53,	332,	 ' 1st Published ' ,	 ' Amazing Reads (India) ' ,	648,	 ' Yes ' ,	50,	26),
(172 , 	 ' The Power of Your Subconscious Mind ' ,	 ' Dr. Joseph Murphy ' ,	 ' Self-help and meditation ' ,	31.81,	 ' In Stock ' ,	0,	312,	 ' Edition ' ,	 ' Amazing Reads (India) ' ,	692,	 ' No ' ,	35,	17),
(260 , 	 ' How To Talk To Anyone ' ,	 ' Leil Lowndes ' ,	 ' Self-help and meditation ' ,	34.51,	 ' In Stock ' ,	37,	352,	 ' 1st ' ,	 ' Harper Element (India) ' ,	388,	 ' Yes ' ,	5,	3),
(411 , 	 ' How To Instantly Connect With Anyone ' ,	 ' Leil Lowndes ' ,	 ' Self-help and meditation ' ,	13.08,	 ' In Stock ' ,	0,	336,	 ' 1st Edition ' ,	 ' McGraw-Hill (India) ' ,	0,	 ' No ' ,	0,	0),
(466 , 	 ' Winning ' ,	 ' Jack Welch, Suzy Welch ' ,	 ' Self-help and meditation ' ,	16.47,	 ' In Stock ' ,	2,	372,	 ' 16th Impression ' ,	 ' Harpercollins Publishers (India) ' ,	0,	 ' Yes ' ,	27,	13),
(422 , 	 ' The Art of War ' ,	 ' Sun Tzu ' ,	 ' War Tactics and Foreign Policy ' ,	10.99,	 ' In Stock ' ,	11,	100,	 ' 1st Edition ' ,	 ' Fingerprint Publishing (India) ' ,	425,	 ' Yes ' ,	1,	0),
(450 , 	 ' Harry Potter and the Philosophers Stone (1997) ' ,	 ' J. K. Rowling ' ,	 '  Mystery, Detective, Thriller and Adventure ' ,	25.97,	 ' In Stock ' ,	5,	352,	 ' New Edition ' ,	 ' Bloomsbury Publishing (India) ' ,	266,	 ' Yes ' ,	40,	22)


SELECT * FROM [BOOK].[BOOKS]

INSERT INTO [CUSTOMER].[CUSTOMERS]([CUSTOMER_ID],[CUSTOMER_NAME],[EMAIL],[PHONE_NUMBER],[CITY],[COUNTRY])
VALUES
					
(84,	 ' Deborah Griffith ' ,	 ' balljoseph@wright-keith.net ' ,	1234567891,	 ' South Craigfort ' ,	 ' Denmark ' ),
(137,	 ' Crystal Clements ' ,	 ' kimberlybennett@curtis.com ' ,	1234567892,	 ' East Derekberg ' ,	 ' Nicaragua ' ),
(216,	 ' Susan Fuller ' ,	 ' beanmichael@burnett-stewart.net ' ,	1234567893,	 ' Austinbury ' ,	 ' Equatorial Guinea ' ),
(433,	 ' Jamie Ramirez ' ,	 ' amandahood@warren.com ' ,	1234567894,	 ' Dianamouth ' ,	 ' Slovenia ' ),
(14,	 ' Marcus Murphy ' ,	 ' connerjohn@yahoo.com ' ,	1234567895,	 ' Smithbury ' ,	 ' Guinea-Bissau ' ),
(439,	 ' Stephen Vasquez ' ,	 ' ricemiguel@yahoo.com ' ,	1234567896,	 ' Hamiltonstad ' ,	 ' Rwanda ' ),
(105,	 ' Susan Hicks ' ,	 ' jeffrey91@yahoo.com ' ,	1234567897,	 ' East Rebecca ' ,	 ' Montenegro ' ),
(32,	 ' Matthew Johnson ' ,	 ' austinkenneth@manning.net ' ,	1234567898,	 ' Kirstenborough ' ,	 ' Israel ' ),
(109,	 ' Matthew Williams ' ,	 ' jeffrey41@diaz.com ' ,	1234567899,	 ' Rebeccafurt ' ,	 ' Somalia ' ),
(94,	 ' Ronald Osborn ' ,	 ' staciekelley@heath.com ' ,	1234567900,	 ' Lake Benjamin ' ,	 ' Cameroon ' ),
(131,	 ' Thomas Garcia ' ,	 ' rmiller@gmail.com ' ,	1234567901,	 ' West Monicabury ' ,	 ' Argentina ' ),
(423,	 ' Jennifer Murray ' ,	 ' wilsonbrittany@hotmail.com ' ,	1234567902,	 ' South Ashleychester ' ,	 ' Zimbabwe ' ),
(420,	 ' Kristine Kim ' ,	 ' sarahwilliams@hotmail.com ' ,	1234567903,	 ' Lake Robert ' ,	 ' Nigeria ' ),
(454,	 ' John Wood ' ,	 ' johnsonalexander@gmail.com ' ,	1234567904,	 ' Richardsonville ' ,	 ' New Caledonia ' ),
(127,	 ' Vanessa Gaines ' ,	 ' tbullock@gmail.com ' ,	1234567905,	 ' Rodriguezmouth ' ,	 ' Wallis and Futuna ' ),
(412,	 ' Stacey Flores ' ,	 ' jackjackson@hotmail.com ' ,	1234567906,	 ' East Michaelfurt ' ,	 ' Saint Helena ' ),
(462,	 ' Christine Maldonado ' ,	 ' ztaylor@yahoo.com ' ,	1234567907,	 ' Smithborough ' ,	 ' Chile ' ),
(377,	 ' David Watson ' ,	 ' laurenlawson@alvarez-mcfarland.com ' ,	1234567908,	 ' New Josephtown ' ,	 ' Equatorial Guinea ' ),
(496,	 ' Marc Nash ' ,	 ' joshua59@gmail.com ' ,	1234567909,	 ' Davidton ' ,	 ' French Guiana ' ),
(195,	 ' Robert Salas ' ,	 ' schultzjohn@thomas.com ' ,	1234567910,	 ' Schultzchester ' ,	 ' Denmark ' ),
(356,	 ' Edgar Frost ' ,	 ' maria51@gmail.com ' ,	1234567911,	 ' Jonathanhaven ' ,	 ' Saudi Arabia ' ),
(177,	 ' Stacey Adams ' ,	 ' fjohnson@gmail.com ' ,	1234567912,	 ' Clintonmouth ' ,	 ' Iceland ' ),
(119,	 ' Hannah Drake ' ,	 ' sandersallen@hotmail.com ' ,	1234567913,	 ' Deannabury ' ,	 ' Faroe Islands ' ),
(266,	 ' Christina Mitchell ' ,	 ' justin67@yahoo.com ' ,	1234567914,	 ' Bridgestown ' ,	 ' Trinidad and Tobago ' ),
(265,	 ' James Martin ' ,	 ' reynoldstyrone@wiggins.com ' ,	1234567915,	 ' North James ' ,	 ' Yemen ' ),
(294,	 ' Dylan Bell ' ,	 ' isaac43@gmail.com ' ,	1234567916,	 ' North Aaron ' ,	 ' Guam ' ),
(310,	 ' Debbie Sampson ' ,	 ' collin21@hotmail.com ' ,	1234567917,	 ' Christopherburgh ' ,	 ' Bahamas ' ),
(151,	 ' William Burns ' ,	 ' valeriemack@gmail.com ' ,	1234567918,	 ' South Kristyville ' ,	 ' Netherlands ' ),
(305,	 ' John Maxwell ' ,	 ' martinsamantha@martin.net ' ,	1234567919,	 ' Nolanstad ' ,	 ' Cuba ' ),
(438,	 ' Dylan Garcia ' ,	 ' oanderson@yahoo.com ' ,	1234567920,	 ' Hallfort ' ,	 ' Turkey ' ),
(386,	 ' Amanda Morton ' ,	 ' lolsen@jones.com ' ,	1234567921,	 ' Marktown ' ,	 ' Antigua and Barbuda ' ),
(292,	 ' Jeffrey Shannon ' ,	 ' nmcmillan@smith.com ' ,	1234567922,	 ' New Carlosbury ' ,	 ' Malta ' ),
(478,	 ' Kristin Hall ' ,	 ' michele78@yahoo.com ' ,	1234567923,	 ' Underwoodfurt ' ,	 ' Cuba ' ),
(463,	 ' Ryan Love ' ,	 ' joseph37@gmail.com ' ,	1234567924,	 ' Leestad ' ,	 ' Anguilla ' ),
(303,	 ' Daniel Gonzalez ' ,	 ' nday@combs.com ' ,	1234567925,	 ' Hoovermouth ' ,	 ' Fiji ' ),
(417,	 ' Benjamin Wallace ' ,	 ' alexander26@hotmail.com ' ,	1234567926,	 ' Schroederton ' ,	 ' Botswana ' ),
(110,	 ' Ryan Lara ' ,	 ' benjamin38@thompson-adams.net ' ,	1234567927,	 ' Port Jameschester ' ,	 ' Chad ' ),
(15,	 ' Nicholas Harris ' ,	 ' christine93@perkins.com ' ,	1234567928,	 ' Davistown ' ,	 ' Canada ' ),
(488,	 ' Tonya Arnold ' ,	 ' aprice@hotmail.com ' ,	1234567929,	 ' Nelsonmouth ' ,	 ' Japan ' ),
(120,	 ' Beth Gomez ' ,	 ' wjackson@bowen.com ' ,	1234567930,	 ' Hollyhaven ' ,	 ' Myanmar ' )


SELECT * FROM[CUSTOMER].[CUSTOMERS]

INSERT INTO [ORDERS].[ORDERS]([ORDER_ID],[CUSTOMER_ID],[BOOK_ID],[ORDER_DATE],[QUANTITY],[TOTAL_AMOUNT],[ORDER_STATUS])
VALUES
						 
(1101,	84,	169,	 ' 05/26/2023 ' ,	8,	188.56,	 ' Delivered ' ),
(1102,	137,	301,	 ' 01/23/2023 ' ,	10,	216.6,	 ' Delivered ' ),
(1103,	216,	261,	 ' 05/27/2024 ' ,	6,	85.5,	 ' Delivered ' ),
(1104,	433,	343,	 ' 11/25/2023 ' ,	7,	301.21,	 ' Delivered ' ),
(1105,	14,	431,	 ' 07/26/2023 ' ,	7,	136.36,	 ' Delivered ' ),
(1106,	439,	119,	 ' 10/11/2024 ' ,	5,	249.4,	 ' Delivered ' ),
(1107,	105,	467,	 ' 10/23/2023 ' ,	6,	82.92,	 ' Delivered ' ),
(1108,	32,	159,	 ' 05/07/2024 ' ,	4,	144.84,	 ' Delivered ' ),
(1109,	109,	410,	 ' 01/04/2024 ' ,	9,	128.97,	 ' Delivered ' ),
(1110,	94,	122,	 ' 07/09/2024 ' ,	4,	123,	 ' Delivered ' ),
(1111,	131,	206,	 ' 10/16/2023 ' ,	1,	38.01,	 ' Delivered ' ),
(1112,	423,	3,	 ' 06/17/2024 ' ,	2,	31.5,	 ' Delivered ' ),
(1113,	420,	180,	 ' 06/08/2023 ' ,	5,	125.45,	 ' Delivered ' ),
(1114,	454,	319,	 ' 08/24/2023 ' ,	2,	85.22,	 ' Delivered ' ),
(1115,	127,	479,	 ' 01/10/2023 ' ,	6,	229.62,	 ' Delivered ' ),
(1116,	412,	196,	 ' 10/06/2023 ' ,	8,	53.52,	 ' Delivered ' ),
(1117,	462,	481,	 ' 03/20/2023 ' ,	5,	52.75,	 ' Delivered ' ),
(1118,	377,	101,	 ' 08/07/2024 ' ,	4,	193.96,	 ' Delivered ' ),
(1119,	496,	60,	 ' 11/17/2023 ' ,	9,	316.26,	 ' Delivered ' ),
(1120,	195,	67,	 ' 07/14/2023 ' ,	1,	10.23,	 ' Delivered ' ),
(1121,	356,	287,	 ' 12/05/2024 ' ,	3,	120.57,	 ' Delivered ' ),
(1122,	177,	427,	 ' 06/10/2024 ' ,	3,	54,	 ' Delivered ' ),
(1123,	119,	303,	 ' 08/04/2023 ' ,	3,	115.65,	 ' Delivered ' ),
(1124,	266,	192,	 ' 07/10/2023 ' ,	3,	145.11,	 ' Delivered ' ),
(1125,	265,	250,	 ' 05/25/2023 ' ,	10,	126.5,	 ' Delivered ' ),
(1126,	294,	407,	 ' 06/11/2023 ' ,	1,	42.19,	 ' Delivered ' ),
(1127,	310,	156,	 ' 12/03/2024 ' ,	1,	31.68,	 ' Delivered ' ),
(1128,	151,	423,	 ' 11/27/2024 ' ,	8,	205.04,	 ' Delivered ' ),
(1129,	305,	446,	 ' 10/05/2023 ' ,	8,	275.92,	 ' Delivered ' ),
(1130,	438,	248,	 ' 09/23/2023 ' ,	6,	281.94,	 ' Delivered ' ),
(1131,	386,	279,	 ' 03/12/2024 ' ,	8,	244,	 ' Delivered ' ),
(1132,	292,	313,	 ' 12/06/2024 ' ,	4,	188.64,	 ' Delivered ' ),
(1133,	478,	253,	 ' 04/15/2024 ' ,	5,	58.3,	 ' Delivered ' ),
(1134,	463,	146,	 ' 06/27/2024 ' ,	3,	43.5,	 ' Delivered ' ),
(1135,	303,	172,	 ' 07/08/2023 ' ,	5,	184.1,	 ' Delivered ' ),
(1136,	417,	260,	 ' 01/21/2024 ' ,	9,	446.31,	 ' Delivered ' ),
(1137,	110,	411,	 ' 12/27/2023 ' ,	4,	60.12,	 ' Delivered ' ),
(1138,	15,	466,	 ' 06/26/2023 ' ,	4,	148.68,	 ' Delivered ' ),
(1139,	488,	422,	 ' 08/03/2024 ' ,	8,	367.28,	 ' Delivered ' ),
(1140,	120,	450,	 ' 07/03/2024 ' ,	2,	91.5,	 ' Delivered ' )

SELECT * FROM [ORDERS].[ORDERS]

-------SELECT QUERIES

---WRITE A QUERY TO RETRIEVE ALL BOOKS THAT ARE WORTH MORE THAN $20
SELECT [BOOK TITLE]= [TITLE] ,[PRICES]= FORMAT([PRICE],'C0')
FROM[BOOK].[BOOKS]
WHERE PRICE> 20

---SELECTING THE TOP 5 MOST EXPENSIVE BOOKS
SELECT TOP 5
[BOOK_ID]AS ID,[TITLE] AS BOOKNAME,[AUTHOR] AS AUTHOR,[PRICE]AS PRICE
FROM[BOOK].[BOOKS]
ORDER BY [PRICE] DESC

---WRITE A QUERY TO FIND AVERAGE PRICE BY CATEGORY
SELECT [AVERAGE PRICE]=FORMAT(AVG([PRICE]),'C0'),[CATEGORY]
FROM [BOOK].[BOOKS]
GROUP BY [CATEGORY]

---WRITE A QUERY TO DISPLAY ALL TOTAL AMOUNT VALUES BETWEEN 200 AND 500
SELECT [TITLE] AS BOOKTITLE,[TOTAL AMOUNT]= FORMAT([TOTAL_AMOUNT],'C0')
FROM [BOOK].[BOOKS] AS A
JOIN[ORDERS].[ORDERS] AS B
ON A.BOOK_ID =B.BOOK_ID
WHERE TOTAL_AMOUNT BETWEEN 200 AND 500

 ----DDLs
 ---ADD A NEW COLUMN TO BOOKS TABLE
 ALTER TABLE[BOOK].[BOOKS]
 ADD DISCOUNT DECIMAL(10,2) NULL

 ---CREATE ANOTHER TABLE 'SALES'
 CREATE TABLE BOOK.SALES
 (
 SALES_ID INT NOT NULL,
 DATE_SOLD DATE NOT NULL,
 AMOUNT DECIMAL(10,2) NOT NULL
 )

 ----DELETE THE DISCOUNT COLUMN
 ALTER TABLE[BOOK].[BOOKS]
DROP COLUMN [DISCOUNT]

----RENAME SALES AS PURCHASES
EXEC SP_RENAME '[BOOK].[SALES]', 'PURCHASES'

------DMLs

------WRITE AN INSERT QUERY TO ADD A NEW BOOK TO THE BOKKS TABLE WITH BOOK ID, PRICE, AND CATEGORY
INSERT INTO [BOOK].[BOOKS]([BOOK_ID],[TITLE],[AUTHOR],[CATEGORY],[PRICE],[STOCK_STATUS])
VALUES
( 926, 'Hafsatu Bebi', 'Fatima Bala', 'Novel', 67.22, 'In stock')

