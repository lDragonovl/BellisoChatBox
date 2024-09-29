USE [PRNDatabase]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] NOT NULL,
	[brand_name] [varchar](50) NOT NULL,
	[brand_logo] [varchar](255) NOT NULL,
	[isAvailable] [bit] NOT NULL,
 CONSTRAINT [brand_brand_id_primary] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[username] [varchar](50) NOT NULL,
	[pro_id] [varchar](10) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cate_id] [int] NOT NULL,
	[cate_name] [varchar](50) NOT NULL,
	[keyword] [varchar](2) NOT NULL,
	[isAvailable] [bit] NOT NULL,
 CONSTRAINT [category_cate_id_primary] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[email] [varchar](255) NOT NULL,
 CONSTRAINT [customer_username_primary] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_address]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_address](
	[ID] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[address] [text] NOT NULL,
	[specific] [nvarchar](255),
	[isDefault] [bit] NOT NULL,
 CONSTRAINT [delivery_address_id_primary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_Product]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_Product](
	[receipt_id] [int] NOT NULL,
	[date_import] [date] NOT NULL,
	[person_change] [nvarchar](50) NOT NULL,
	[payment] [float] NOT NULL,
 CONSTRAINT [import_product_receipt_id_primary] PRIMARY KEY CLUSTERED 
(
	[receipt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](32) NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[SSN] [varchar](11) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [manager_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/19/2024 4:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [varchar](10) NOT NULL,
	[manager_id] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[total_price] [float] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[order_des] [text] NULL,
	[status] [int] NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[address] [text] NOT NULL,
	CONSTRAINT [order_order_id_primary] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 6/19/2024 4:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[order_id] [varchar](10) NOT NULL,
	[pro_id] [varchar](10) NOT NULL,
	[pro_name] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/19/2024 4:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pro_id] [varchar](10) NOT NULL,
	[cate_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[pro_quan] [int] NOT NULL,
	[pro_price] [float] NOT NULL,
	[pro_des] [text] NOT NULL,
	[discount] [int] NOT NULL,
	[isAvailable] [bit] NOT NULL,
 CONSTRAINT [product_pro_id_primary] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Attribute]    Script Date: 6/19/2024 4:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Attribute](
	[pro_id] [varchar](10) NOT NULL,
	[feature] [varchar](50) NOT NULL,
	[description] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Image]    Script Date: 6/19/2024 4:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[pro_id] [varchar](10) NOT NULL,
	[pro_img] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt_Product]    Script Date: 6/19/2024 4:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt_Product](
	[receipt_id] [int] NOT NULL,
	[pro_id] [varchar](10) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (1, N'Asus', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717914957/Brands/dkrlpjps52vsacomynik.png', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (2, N'Logitech', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717914988/Brands/ocvp75lvpkobdl7tsluu.png', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (3, N'Corsair', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717915043/Brands/u15iyz2vnl9szxsiuee0.png', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (4, N'DareU', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717915068/Brands/mkm8jxdozqvkyp6unk0k.jpg', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (5, N'Akko', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717915086/Brands/y8ejiik9cch4ooenuv5b.webp', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (6, N'Razer', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717915101/Brands/fgxosmijxov7wpfm1c8x.png', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (7, N'Steelseries', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717915116/Brands/i1mkyisiddlvx0tlj41n.jpg', 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [brand_logo], [isAvailable]) VALUES (8, N'HyperX', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717915138/Brands/rzed9esfc4alzf2u1rjb.png', 1)
GO
INSERT [dbo].[Cart] ([username], [pro_id], [pro_name], [quantity], [price]) VALUES (N'cleny30', N'CT003', N'DareU H1056X Wireless ', 2, 112)
INSERT [dbo].[Cart] ([username], [pro_id], [pro_name], [quantity], [price]) VALUES (N'cleny30', N'GC003', N'Razer ISKUR X Chair', 1, 240)
INSERT [dbo].[Cart] ([username], [pro_id], [pro_name], [quantity], [price]) VALUES (N'cleny30', N'GC002', N'ASUS ROG Chariot Core Chair', 1, 450)
GO
INSERT [dbo].[Category] ([cate_id], [cate_name], [keyword], [isAvailable]) VALUES (1, N'Keyboard', N'KB', 1)
INSERT [dbo].[Category] ([cate_id], [cate_name], [keyword], [isAvailable]) VALUES (2, N'Mouse', N'MS', 1)
INSERT [dbo].[Category] ([cate_id], [cate_name], [keyword], [isAvailable]) VALUES (3, N'Headphone', N'HP', 1)
INSERT [dbo].[Category] ([cate_id], [cate_name], [keyword], [isAvailable]) VALUES (4, N'Gaming Chairs', N'GC', 1)
INSERT [dbo].[Category] ([cate_id], [cate_name], [keyword], [isAvailable]) VALUES (5, N'Controller', N'CT', 1)
GO
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [email]) VALUES (N'cleny30', N'e10adc3949ba59abbe56e057f20f883e', N'Cleny', N'0123456789', N'kushirotm@gmail.com')
GO
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'CT001', 5, 6, N'Razer Raiju Ultimate', 0, 250, N'Razer Raiju Ultimate is one of the products that supports gamers from one of the world''s leading gaming gear manufacturers in addition to the product lines of  mechanical keyboards , gaming mice and gaming headsets.  
Designed specifically for gamers: 
With a height and shape for your thumb to adapt to, and a choice of different D-pad layouts, use the Razer Raiju Ultimate to choose the one that''s most comfortable for your hand. . A handle with a reasonable layout will help you hold the key to avoid pressing it.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'CT002', 5, 4, N'DareU H101X Wireless Pink', 5, 40, N'For console gamers, one of the indispensable and widely used gaming accessories today is the game controller. And to bring a breath of fresh air in this product segment, DareU has launched a product from its own production line with a model called DareU H101X Wireless Pink . Let''s learn more about this product with GEARVN! 
Gentle and feminine design
Complete with a symmetrical - ergonomic design, DareU H101X Wireless Pink provides comfort when using a gaming controller , suitable and suitable for all hand shapes. The grip and grip area of ??the DareU H101X Wireless Pink is smooth to create a comfortable feeling when used for long periods of time. Coming to the stylish pink version, DareU H101X Wireless Pink brings gentleness and prominence to female gamers or "strong" entertainment corners, through extremely personal details and button icons.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'CT003', 5, 4, N'DareU H1056X Wireless ', 5, 70, N'For console gamers, one of the indispensable and widely used gaming accessories today is the game controller. And to bring a breath of fresh air in this product segment, DareU has launched a product from its own production line with a model called DareU H101X Wireless Black . Let''s learn more about this product with GEARVN!

', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'CT004', 5, 1, N'Asus ROG Raikiri Pro ', 5, 180, N' For console gaming setups , game controllers are indispensable devices for gamers. Always among the top gaming consoles, Xbox from Microsoft is always the top choice for all gamers, especially the controller product line. And here GEARVN will introduce to you the latestAsus ROG Raikiri Pro   with the greatest improvements.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'GC001', 4, 3, N'Corsair TC100 Leatherette Chair ', 5, 200, N'Corsair TC100 Leatherette Black CF-9010050-WW gaming chair line has a unique design that adds inspiration when playing games and working. At the same time, it is made from high-quality materials to bring a feeling of comfort all day long.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'GC002', 4, 1, N'ASUS ROG Chariot Core Chair', 5, 450, N'Crafted for comfort.
The ROG Chariot Core gaming chair evokes the style and feel of a high-end racing car. With a high-density foam headrest, memory foam lumbar support, breathable PU leather seat , 4D adjustable armrests, lockable tilt mechanism and highly durable components, the Chariot Core giving you safe, comfortable style - and allowing you to express your own personality in any gaming arena.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'GC003', 4, 6, N'Razer ISKUR X Chair', 5, 300, N'If you are a gamer or regular computer user, the name gaming chair is no longer strange to you, right? To be able to mention one of the top names in the gaming chair industry, Razer will always be named on our list. The brand with the three beams logo has launched a new groundbreaking gaming chair called Razer ISKUR X. Let''s learn more details about this product with GEARVN right here!
', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'GC004', 4, 3, N'Corsair TC200 Leatherette', 5, 200, N'Not only does it possess an aggressive design through meticulously crafted angular lines, the Corsair TC200 with its luxurious Light Gray/White color tone and Leatherette leather material will highlight every corner of the camera.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP001', 3, 1, N'Asus ROG Delta S Core ', 5, 90, N' The Asus ROG Delta S Core headset is the lightest gaming headset model currently in the Asus Delta series with a weight of only 270 grams. Designed for unmatched performance and comfort, the Delta S Core features convenient and modern D-shaped ear cups. It fits the ear shape of most users perfectly, reducing unwanted contact area by up to 20% for a better fit and comfort. Exclusive 50mm ASUS Essence drivers with virtual 7.1 surround sound and boom microphone to deliver the ultimate gaming experience certified by Discord and TeamSpeak.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP002', 3, 1, N'ASUS TUF GAMING H1', 10, 50, N'Always known for its extremely high-quality products, TUF Gaming also scores points in the eyes of users thanks to its affordable prices. From monitors, laptops to VGA, TUF Gaming always tries to bring the best experience and meet all the needs of the most demanding users. And now, the "child" from ASUS will enter the equally pleasant market, which is headphones with the ASUS TUF Gaming H1 . Let''s learn more about the product with GEARVN right here!', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP003', 3, 2, N'Logitech G733 LIGHTSPEED ', 20, 120, N' Logitech G733 LIGHTSPEED Wireless White  line of computer headsets are designed to bring comfort to gamers. This wireless headset is equipped with the stereophonic sound, audio filters and advanced lighting features you need to see, speak and play in style like never before.
Eye-catching design, super light weight
Designed in the shape of an Over-ear headphone with a weight of only 278 grams, a little more than half a pound (250g). It is very lightweight and the elastic straps are designed to reduce and distribute weight.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP004', 3, 2, N'Logitech G431 Headset', 50, 70, N' Loud and clear sound: 
The over-the- ear headset has a built-in 6mm enhanced large mic to ensure your teammates can hear you. The mic boom can be folded away to mute when you don''t want your voice to be heard.
DTS HEADPHONE:X 2.0 technology: 
New generation DTS Headphone:X 2.0 surround sound makes Logitech''s computer headset more unique, using Logitech''s G HUB software, allowing you to hear enemies hiding behind, possible signals Special features and immersive environments - all around you. Experience 3D audio that goes beyond 7.1 channels to make you feel like you''re in the action.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP005', 3, 8, N' HyperX Cloud III  Headset', 55, 100, N' HyperX Cloud III Wireless headset is the new gaming headset from Hyper. The Cloud Core series always leaves a mark in the hearts of users because of its excellent sound quality, players will be immersed in clear, vivid sounds. HyperX Cloud Core Wireless can be said to be one of the most worthy wireless headsets for gamers at the moment.
Beautiful HyperX Cloud Core design: 
The HyperX Cloud Core computer headset has a simple earcup design with the signature HyperX logo right on the ear cup. The combination of black and red tones creates an extremely harmonious, luxurious and clean overall.
', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP006', 3, 6, N'Razer Shark V2 Pro Black', 55, 220, N'Black Shark V2 Pro, the latest line of gaming headphones from Razer, is integrated with many modern technologies to bring players vivid, powerful sound quality. It doesn''t stop there, thanks to the super soft Flowknit cushioning, it will bring a comfortable and airy feeling when used all day long.
', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP007', 3, 7, N'Steelseries Arctis 7 Plus', 7, 175, N'Steelseries is known as a manufacturer of Gaming Gear devices that possess impressive performance and luxurious design. That is shown through the latest product line from the company, Arctis 7 Plus is a line of bluetooth gaming headsets equipped with many modern features, easily compatible with all systems from USB-C to PS5,. ..

', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'HP008', 3, 7, N'Steelseries Arctis Prime ', 3, 120, N'Computer headset  with high-precision audio drivers inherited from Arctis Pro, fine-tuned for maximum accuracy for the most intense gaming sessions. 

', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB001', 1, 1, N'ASUS ROG Strix Flare II ', 34, 160, N'Detailed review of the ASUS ROG Strix Flare II Nx Blue Switch mechanical keyboard
Not only outstanding in PC component product lines, ASUS is also known as one of the brands that specializes in bringing extremely high-class gaming gear peripherals in terms of design and performance, from headset lines. gaming, multi-connected computer mice from wired to wireless and even gaming keyboards.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB002', 1, 2, N'Logitech G Pro X', 3, 140, N'Logitech GX Switch

Logitech''s exclusive GX switch version delivers high performance and long-lasting durability over time. One of the logitech g pro combo mechanical keyboard product lines has an integrated hot swap feature that allows you to replace another switch to innovate the  experience  during use.
The vast Logitech G Hub ecosystem provides you with not only the ability to customize each key RGB LED effect on the Logitech G Pro Gaming computer mice , headphones, etc. in this ecosystem. In addition, you can also use this software to assign extremely convenient macro tasks.




', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB003', 1, 3, N'Corsair K60 Pro Red', 43, 130, N'Detailed review of the Corsair K60 Pro Red Led gaming keyboard
Beauty and roughness : The cheap mechanical keyboard  Corsair K60 Pro Red Led has a minimalist design, combining many angular lines to create an extremely elegant looking keyboard.
Viola Switch comes from Cherry :
Corsair has equipped the Corsair K60 Pro Red Led with a new type of switch that no brand has used before, which is Cherry Viola. This type of switch provides fast, linear key press speed (almost like Cherry Red), simple, durable switch structure and key travel is still 4mm and the active point is 2mm. Overall, this will be a switch that is very easy to get used to and suitable for gaming needs.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB004', 1, 4, N'DareU EK520', 50, 35, N'Detailed review of DareU EK520 Optical mechanical keyboard
The DareU EK520 keyboard  is manufactured by DareU, a company specializing in providing peripheral devices for gamers and office workers. Products from Dareu are of high quality and affordable for consumers.
Good material, cheap price:
The DareU EK520 keyboard is designed with a frame made from sturdy, durable, and smooth material. Along with the keycaps made from high-quality plastic, it ensures a long life for the device, without the keys fading after a long time.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB005', 1, 5, N'AKKO 3098 RF Dracula', 30, 70, N'Detailed review of the AKKO 3098 RF Dracula Castle keyboard
AKKO 3098 RF Dracula Castle is a cheap mechanical keyboard line with a color scheme inspired by Count Dracula, giving players a lot of creative inspiration and excitement when playing recreational games. In particular, thanks to the Fullsize Layout and exclusive AKKO V3 switches, this promises to be the computer keyboard line you are looking for!', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB006', 1, 6, N'Razer Blackwidow V3 Pro', 8, 230, N'The world''s first and most iconic Razer Blackwidow V3 Pro mechanical keyboard makes a landmark development. Enter a new wireless meta with the Razer BlackWidow V3 Pro—with 3 connection modes that deliver unparalleled versatility and a satisfying gaming experience including best-in-class switches and full-height keys .
Razer Blackwidow V3 Pro Green Switch - a mechanical bluetooth keyboard equipped with our most advanced wireless technology for low-latency gaming and ultra-responsive input—delivered via an optimized data protocol optimized, ultra-fast radio frequency and seamless frequency switching in the noisiest, data-saturated environments.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB007', 1, 7, N'Steelseries Apex 3', 15, 70, N'Apex 3 series mechanical keyboards are certified to be water and dust resistant according to IP32 standards (IP32 is an industry standard for water and dust resistance). Waterproof and dustproof keeps your keyboard clean and has a long life. 

You don''t have to worry about accidentally getting your keyboard wet. With the IP32 standard, dirt and debris will have a harder time penetrating the keyboard, making the internal components safe for long-term use.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB008', 1, 6, N'Razer DeathStalker V2 ', 9, 120, N'Razer DeathStalker V2 Pro TKL possesses a compact, thin and extremely luxurious design. In the segment, the TKL gaming keyboard DeathStalker V2 Pro TK will be one of the choices you should not miss. ', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'KB009', 1, 5, N'AKKO 3098S World Tour London', 6, 120, N'AKKO 3098S World Tour London is a product line that continues the success of the "World Tour Tokyo" series with impressive and unique color combinations. Along with performance upgrades, GEARVN is confident that the AKKO 3098S World Tour London will be a mechanical keyboard line that you should not miss. ', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS001', 2, 1, N'Asus ROG Harpe Ace', 7, 115, N'ASUS - The brand is extremely famous for its technology products, from laptops to computer components. And when it comes to gaming gear , ASUS still owns a high-end gaming mouse product line called ASUS ROG Harpe Ace. Let''s welcome the latest version of the product lineup with the ASUS ROG Harpe Ace Aim Lab Edition model . Join GEARVN to learn more about this mouse!', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS002', 2, 1, N'Asus ROG Chakram X', 43, 130, N'ASUS - The brand is extremely famous for its technology products, from laptops to computer components. And when it comes to gaming gear , ASUS still owns a high-end gaming mouse product line called Asus ROG Chakram X. Let''s welcome the latest version of the product lineup with the Asus ROG Chakram X . 
Beautiful with Aura Sync RGB lighting
The ROG logo on Asus ROG Chakram X adorns the mouse, affirming the name of the famous gaming laptop brand. Combined with the brilliant ARGB effects on Aura Sync RGB, this will be a great decoration for PC systems and entertainment and work corners.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS004', 2, 1, N'Asus ROG Strix Impact II', 8, 50, N'Accurate and high performance
Asus collaborated with professional gamers in designing ROG Strix Impact II, delivering an ambidextrous ergonomic design optimized for performance play and comfortable grip, with a weight of just 79g. The 6,200 dpi sensor tracks at up to 220 ips and with a 1000 Hz polling rate, so you''re guaranteed high accuracy, quick response and precise control - and all without a hint of lag. . Impact II even includes five programmable buttons, allowing you to customize controls for your game or play style.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS005', 2, 2, N'Logitech G502 X', 6, 150, N'
Logitech  G502 X PLUS Mouse is the latest product of the popular G502 series. Redesigned and enhanced with modern gaming technology, including the first hybrid optical-mechanical Lightforce switch, Wireless Lightspeed, LIGHT SYNC RGB and Hero 25K optical sensor, the rugged Logitech G502 X PLUS is one of the most worth buying gaming gear  for gamers in the near future.
', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS006', 2, 2, N'Logitech G703 HERO', 4, 75, N'Logitech G703 HERO Lightspeed Wireless Mouse
Logitech G703 is one of the computer mouse lines that possesses an ergonomic design that hugs the palm of the hand to support each mouse movement more firmly.
G703 is one of the latest Logitech wireless mouse product lines to join the game with the new generation 16K HERO sensor. Logitech''s most advanced sensor to date, with 1:1 tracking, 400+ IPS, and 100-16,000 maximum DPI sensitivity — plus smoothing, filtering, and acceleration.
Logitech G703 is one of the few wireless gaming computer mice with a comfortable design and light weight, with a rubber handle to help increase mouse movement. In addition, during use, users can customize the weight of the mouse with the 10g option to help you be more flexible in use.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS007', 2, 6, N'Razer Cobra', 9, 50, N'Detailed review of the Razer Cobra mouse
The Razer Cobra line of gaming mice has a symmetrical design that makes mouse movements more secure. At the same time, equipped with up to 6 buttons intelligently arranged along the mouse body to help make operations more effective. This promises to be one of the gaming computer mouse lines worth owning from Razer!', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS008', 2, 6, N'Razer DeathAdder V3 ', 9, 140, N'Victory takes on a new shape with the Razer DeathAdder V3 Pro. Refined and reforged with the aid of top esports pros, its iconic ergonomic form is now more than 25% lighter than its predecessor, backed by a set of cutting-edge upgrades to push the limits of competitive play.
Razer DeathAdder V3 Pro''s  ergonomic design and wireless connection give you a comfortable feeling when used for long periods of time. Perfectly suited for palm grip, and also works well with fingertip swipes.', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS009', 2, 7, N'Steelseries Rival 5', 7, 35, N'Detailed review of the Steelseries Rival 5 mouse product
The Steelseries Rival 5 product is a gaming computer mouse with high precision and flexibility. Players can dominate any game with 9 customizable buttons and lightning-fast toggles.
Freely program 9 custom buttons
Players have the right to adjust important keys for convenience in use. The side of the mouse comes with 5 buttons designed for thumb use. Increase the speed of performing many operations so players can have great game experience moments.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS010', 2, 4, N'Dare-U EM908 RGB', 7, 25, N'DareU EM908 RGB has a compact, beautiful design
One of the gaming mouse lines that possesses a palm-sized appearance and size with an ergonomic design that is convenient for the user.

Brings a sense of comfort to gamers and users who have to work for long periods of time without feeling tired when using DAREU EM908 for long periods of time. In addition, to synchronize with the computer system DareU has equipped the EM908 mouse line with a beautiful RGB LED strip of 16.7 million colors around the edge of the mouse. ', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS011', 2, 5, N'Akko Hamster Plus', 6, 20, N'Akko Hamster Wireless is designed to be small, more suitable for women''s hands, but if you are used to holding claw-grip or Fingertip mice, you will definitely be satisfied with the "fat" body of these hamsters. This hamster.

Akko Hamster is finished with pre-colored ABS plastic, not painted on the surface, so the color will definitely last over time. Combined with a set of extremely chill pastel colors, it will definitely please the ladies, and even the guys with gentle, peaceful personalities.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS012', 2, 3, N'Corsair M65 RGB', 7, 65, N'Detailed review of Corsair M65 RGB ULTRA Black mouse
Corsair, a brand that is extremely popular with gamers with its PC components, streaming accessories,... Especially gaming gear products, are always perfected with a bold gaming design and special features. Those will be the strengths that Corsair M65 RGB ULTRA Black will possess. So let''s see with GEARVN what else the gaming mouse from Corsair can bring to gamers!', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS013', 2, 8, N'HYPERX Pulsefire Haste II', 4, 60, N'Detailed review of the HP HYPERX Pulsefire Haste  mouse
HyperX Pulsefire Haste 2 lines of gaming computer mice have a symmetrical design that hugs the palm of the hand, making all operations more secure. Integrating many modern technologies from HyperX, this promises to be one of the gaming mouse lines that offers the outstanding physical control you are looking for.
Ergonomic design, hugs the palm
Possessing an ergonomic mouse design with a symmetrical grip form that hugs the entire palm of the hand, making each mouse move more secure and reducing pressure on the wrist when used for long periods of time.

HYPERX Pulsefire Haste 2 is finished with black as the main color tone, the rounded details are meticulously machined to create an extremely beautiful overall. It is promised that when placed next to a mechanical keyboard , a gaming computer headset will create an extremely high-quality, beautiful gaming space.', 0, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS014', 2, 1, N'ASUS ROG Keris', 4, 65, N'ASUS ROG Keris is equipped with a specially tuned 16,000 dpi sensor. It features ROG''s exclusive push-fit switch sockets and ROG Micro Switches, along with left and right PBT polymer buttons, Asus ROG Omni mouse feet, ROG Paracord lighting, and Aura Sync RGB.

', 20, 1)
INSERT [dbo].[Product] ([pro_id], [cate_id], [brand_id], [pro_name], [pro_quan], [pro_price], [pro_des], [discount], [isAvailable]) VALUES (N'MS015', 2, 1, N'Asus Gladius II ', 4, 70, N'Asus Gladius II is designed for people who feeling sad in love, with powerful design, this mouse can make you feel good, never feel sad, like when you eat coconut, drink watermelon, take a bath in beach and swim in bathroom.', 20, 1)
GO
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Connection type', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Sensitivity (DPI)', N'8500')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Trademark', N' Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Connect', N' Wired (USB 2.0)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Keyboard style ', N'  Full size 100%')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Led', N'Led')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'AURA Sync', N'AURA Sync')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Macro keys', N' All keys are programmable')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'All keys are programmable', N'Keyboard: 435mm x 165mm x 38mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Weight', N' 1113g')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Sensor ', N'8500 DPI Optical Sensor')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Switch', N'Optical Mouse Switches Gen-3')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Size', N'119.6 mm / 4.71 in')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Designs', N'Symmetry')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Connect', N'Wired / Bluetooth 5.1 / Wireless 2.4GHz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'DPI', N'36000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'IPS', N'650')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Weight', N'54G')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Connect', N'Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Trademark', N'DareU')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Connection ', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Led light', N'RGB')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Trademark', N'Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Connect	', N'LIGHTSPEED wireless technology')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Charging port	', N'USB-C')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Battery life	', N'Up to 130 hours (37 hours with RGB enabled)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Maximum acceleration', N'> 40G2')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Max speed', N'> 400 IPS ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Size', N'131.4 mm x 41.1 mm x 79.2 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Resolution (CPI/DPI)', N'6000DPI')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Sensor', N'BRAVO ATG4090')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Size', N'Size')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Trademark', N'Akko')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Sensor    ', N'Optical')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Pixels per inch (DPI)    	', N'1200')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Connect    	', N'Wireless Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Weight (gr)    	', N'84 (including battery)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Battery life    	', N'Up to 6 months')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Trademark', N'Corsair')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Node number	', N'8')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'DPI', N'26,000 ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Sensor', N'MARKSMAN 26K')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Led	', N'2 RGB Zones')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Connect ', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Weight	', N'97g ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Trademark', N'HyperX')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Connection type', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Sensitivity (DPI)', N'Maximum 26,000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Sensor', N'HyperX 26K')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Switch', N'up to 100 million clicks')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Trademark', N'Akko')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Design', N'98 Keys')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Connect	', N'USB Type-C to Type-A (detachable cord) ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'The battery	', N'1300mah ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Size', N'382 x 134 x 40 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Weight', N'382 x 134 x 40 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Switch', N'Akko switch v3 (Cream Blue Pro/ Cream Yellow Pro)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Trademark', N'Steelseries')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Connection ', N'Wired keyboard')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Switch', N'SteelSeries Whisper-Quiet Switches')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Keycaps material	', N'ABS')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Size ', N'Length 444.7 x Width 151.62 x Height 39.69 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Weight', N'816 grams')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Connection ', N'Wired / Wireless RF 2.4GHz / Bluetooth')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Switch', N'70 million clicks')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Sensitivity (DPI)', N'100 ~ 36000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Battery life', N'Up to 150h')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS004', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS004', N'Connect', N'USB 2.0')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS004', N'Sensor', N'Pixart3327')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'Trademark', N'Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'Sensor', N'16K HERO')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'DPI sensitivity', N'100-16,000 maximum')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'IPS', N'400+')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'Connect', N' Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Trademark', N'Steelseries')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Sensor Type', N'optics')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'CPI', N'18000 CPI')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'IPS', N'400, on SteelSeries QcK surface')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Size', N'128.8 x 63.35 x 28.2 (mm)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Switch Type', N'SteelSeries IP54 mechanical switches (')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Connect', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Trademark', N'Corsair')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Led', N'RED')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Size', N'FullSize')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Switch', N'CHERRY VIOLA')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'CHERRY® VIOLA', N'ABS Doubleshot')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Connect', N'Wired, USB 2.0 Type A')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Weight', N'Weight')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Sensor	', N'Focus Pro 30K optical sensor')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'DPI	', N'30000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'IPS', N'750')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Switch', N'Optical Gen-3')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Connect', N'USB, Bluetooth, 2.4 Ghz Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Designs', N'Designs')
GO
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Switch', N'Razer Mechanical Green/Yellow')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Keycaps', N'Keycap ABS Doubleshot')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'Trademark', N'DareU')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'Connect', N'USB cord')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'LED', N'Multi')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'Switch', N'Optical')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Trademark', N'  Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Connect', N'  Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Size', N'  361 x 153 x 34 (mm)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Switch', N'  Logitech GX Switch  Clicky')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Weight', N'  1kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Connection type', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Sensitivity (DPI)', N'8500')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Sensor ', N'8500 DPI Optical Sensor')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Switch', N'Optical Mouse Switches Gen-3')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS007', N'Size', N'119.6 mm / 4.71 in')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Designs', N'Symmetry')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Connect', N'Wired / Bluetooth 5.1 / Wireless 2.4GHz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'DPI', N'36000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'IPS', N'650')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS001', N'Weight', N'54G')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Connect', N'Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Trademark', N'DareU')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Connection ', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Led light', N'RGB')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Trademark', N'Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Connect	', N'LIGHTSPEED wireless technology')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Charging port	', N'USB-C')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Battery life	', N'Up to 130 hours (37 hours with RGB enabled)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Maximum acceleration', N'> 40G2')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Max speed', N'> 400 IPS ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS005', N'Size', N'131.4 mm x 41.1 mm x 79.2 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Resolution (CPI/DPI)', N'6000DPI')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Sensor', N'BRAVO ATG4090')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS010', N'Size', N'Size')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Trademark', N'Akko')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Sensor    ', N'Optical')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Pixels per inch (DPI)    	', N'1200')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Connect    	', N'Wireless Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Weight (gr)    	', N'84 (including battery)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS011', N'Battery life    	', N'Up to 6 months')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Trademark', N'Corsair')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Node number	', N'8')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'DPI', N'26,000 ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Sensor', N'MARKSMAN 26K')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Led	', N'2 RGB Zones')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Connect ', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS012', N'Weight	', N'97g ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Trademark', N'HyperX')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Connection type', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Sensitivity (DPI)', N'Maximum 26,000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Sensor', N'HyperX 26K')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS013', N'Switch', N'up to 100 million clicks')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'Trademark', N'     DareU')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'Connect', N'     Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'Size', N'     160mm x 105mm x 62mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'Weight	', N'     ˜220g')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'Wire length	', N'     1.8M')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'Compatible	', N'     PC, Switch, Android TV & phone')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT002', N'The battery	', N'     650mAh')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Trademark', N'Corsair')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Trademark', N'Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Connect', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Size', N'361 x 153 x 34 (mm)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Switch', N'Logitech GX Switch  Clicky')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB002', N'Weight', N'1kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Trademark', N'Akko')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Design', N'98 Keys')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Connect	', N'USB Type-C to Type-A (detachable cord) ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'The battery	', N'1300mah ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Size', N'382 x 134 x 40 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Weight', N'382 x 134 x 40 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB005', N'Switch', N'Akko switch v3 (Cream Blue Pro/ Cream Yellow Pro)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Trademark', N'Steelseries')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Connection ', N'Wired keyboard')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Switch', N'SteelSeries Whisper-Quiet Switches')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Keycaps material	', N'ABS')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Size ', N'Length 444.7 x Width 151.62 x Height 39.69 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB007', N'Weight', N'816 grams')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Connection ', N'Wired / Wireless RF 2.4GHz / Bluetooth')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Switch', N'70 million clicks')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Sensitivity (DPI)', N'100 ~ 36000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS002', N'Battery life', N'Up to 150h')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS004', N'Trademark', N' Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS004', N'Connect', N' USB 2.0')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS004', N'Sensor', N' Pixart3327')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'Trademark', N'Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'Sensor', N'16K HERO')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'DPI sensitivity', N'100-16,000 maximum')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'IPS', N'400+')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS006', N'Connect', N' Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Trademark', N'Steelseries')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Sensor Type', N'optics')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'CPI', N'18000 CPI')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'IPS', N'400, on SteelSeries QcK surface')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Size', N'128.8 x 63.35 x 28.2 (mm)')
GO
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Switch Type', N'SteelSeries IP54 mechanical switches (')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS009', N'Connect', N'Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Trademark', N'Corsair')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Led', N'RED')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Size', N'FullSize')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Switch', N'CHERRY VIOLA')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'CHERRY® VIOLA', N'ABS Doubleshot')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Connect', N'Wired, USB 2.0 Type A')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB003', N'Weight', N'Weight')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Sensor	', N'Focus Pro 30K optical sensor')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'DPI	', N'30000')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'IPS', N'750')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS008', N'Switch', N'Optical Gen-3')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Connect', N'USB, Bluetooth, 2.4 Ghz Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Designs', N'Designs')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Switch', N'Razer Mechanical Green/Yellow')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB006', N'Keycaps', N'Keycap ABS Doubleshot')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'Trademark', N'DareU')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'Connect', N'USB cord')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'LED', N'Multi')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB004', N'Switch', N'Optical')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Trademark', N'  Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Model', N'  Asus ROG Delta S Core')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Connect', N'  Has standard 3.5mm wire')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Headphone style', N'  Over-ear')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Driver', N'  50mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Sensitivity', N'  -40 dB')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Impedance', N'  32 Ohms')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP001', N'Feature', N'  7.1 virtual surround sound system powered by Windows Sonic')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Connect', N'Has a 3.5mm cable')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Microphone sensitivity', N'-45dB')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Driver size', N'40mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Impedance', N'60 ohms')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Response frequency	', N'20Hz - 20Khz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Microphone frequency	', N'100Hz - 10Khz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP002', N'Weight', N'287 gr')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Headphone type', N'Over-ear')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Response frequency', N'12 Hz - 28 kHz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Impedance', N'32 Ohms')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Sensitivity', N'100 dBSPL/mW @ 1 kHz using HATS')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Drivers', N'50 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Headphone cushion material', N'Breathable foam mattress')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Battery life', N'Up to 70 hours')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Noise cancellation', N'Advanced passive noise cancellation')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Connection type', N'Type A wireless (2.4 GHz), Bluetooth 5.2')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP006', N'Weight', N'320 g')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Trademark', N' Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Connect', N' Bluetooth/Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Compatible', N' PC/PS4')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Software that can be used', N' Raiju application (IOS/ANDROID)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Switch Type', N' RAZER MECHA-TACTILE')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Used Time', N' 11 hours (Bluetooth)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Cable length', N' 3m')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Size', N' 106 x 155 x 66 ( mm )')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT001', N'Weight', N' 370 g')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Material', N'PU leather')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Maximum height', N'188 cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Minimum height', N'45 – 55 cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Chair arm height', N'45 – 52')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Backrest height', N'81 cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Backrest width', N'33 cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Maximum load', N'120 kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Lumbar pillow', N'Have')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Neck pillow', N'Have')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Seat width', N'54 cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Handrail type', N'2D')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Number of wheels', N'5 ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Wheel material', N'High quality plastic')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC001', N'Weight ', N'18.30kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Trademark', N'Razer')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Material', N'PVC leather')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Armrest', N'2D')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Chair cover color	', N'Black, blue')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Reclining angle', N'90°-139°')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Air lift layer	', N'4')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Wheel	', N'Caster 6 cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Chair frame material', N'Metal & Plywood')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Maximum load (kg)	', N'136')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC003', N'Chair weight (kg)	', N'25')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Trademark', N' Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Connect', N' Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Connection standard', N' Receiver USB type A')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Headphone type', N' Over-ear')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Impedance', N' 1kHz 32Ohm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Frequency', N' 20Hz - 20KHz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Headphone cushion material', N' Airy fabric')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP003', N'Compatible', N' Windows 7 or later / MacOS X 10.12 or later / PlayStation 4')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Trademark', N' Logitech')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Headphone type', N' Over-ear')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Connection typ', N' Wired')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Connection standard', N' 3.5mm / USB type A')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Microphone', N' Can be folded when not in use')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Impedance', N' 1 kHz 32 Ohm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Frequency', N' 20Hz - 20KHz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Frame material', N' Alloy')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP004', N'Compatible', N' Windows / MacOS / PlayStation 4 / Nintendo Switch / Smartphone')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Trademark', N' HyperX')
GO
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Response frequency', N' 10Hz-21kHz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Cable Length', N' Headphone cable 1.2m, USB dongle cable 1m3')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Diaphragm', N' 53mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Frame Type', N' Aluminum')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Sensitivity', N' -42dBV (0dB = 1V/Pa at 1kHz)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Connection via jack', N' 3.5mm, USB')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP005', N'Included accessories', N' Microphone, USB soundcard')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Trademark', N'  Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Connect', N'  Wired (USB 2.0)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Keyboard style ', N'  Full size 100%')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Led', N'  Led')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'AURA Sync', N'  AURA Sync')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Macro keys', N'  All keys are programmable')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'All keys are programmable', N'  Keyboard: 435mm x 165mm x 38mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB001', N'Weight', N'  1113g')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Material', N'High quality PU leather')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Armrest', N'4D  (Up/Down, Left/Right, Front/Back, Swivel)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Reclining angle', N'85° ~ 165°')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Chair size', N'134 – 142 x 73 x 73 (cm) (Height x Length x Width)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Chair back height', N'85cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Seat back width', N'73cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Wheel Size', N'65mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Chair frame material', N'Metal')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC002', N'Weight', N'120kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB008', N'Connect', N'Wired / Wireless (2.4 Ghz) / Bluetooth ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB008', N'Media keys', N'	Have')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB008', N'LED', N'	Razer Chroma™ RGB with 16.8 million colors')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB008', N'Switch', N'Razer™ Low-Profile Optical (Linear)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS015', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS015', N'Connect	', N'USB 2.0')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS015', N'Connection type	', N'Wired mouse')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS015', N'Color	', N'Black')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS015', N'Switch	', N'Omron')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS015', N'Resolution (CPI/DPI)	', N'12000DPI')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'Trademark', N'DareU')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'Connect', N'Wireless')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'Size', N'160mm x 105mm x 62mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'Weight', N'˜220g')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'Wire length	', N'1.8M')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'Compatible	', N'PC, Switch, Android TV & phone')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT003', N'The battery	', N'650mAh')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT004', N'Trademark', N' Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT004', N'Connect', N' Wired / Wireless (2.4 Ghz) / Bluetooth ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Trademark', N'SteelSeries')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Model', N'Arctis 7+ Wireless White')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Connect', N'Wireless ')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Wireless range	', N'12 m / 40 ft')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Battery life	', N'Can be up to 30 hours')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Impedance', N'32 Ohms')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Sensitivity	', N'98db')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Frequency	', N'20–20000 Hz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP007', N'Compatible', N'Windows 8.1 or later, Mac OS 10.12 or later')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Trademark', N'Steelseries')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Color', N'Black')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Connect', N'3.5mm jack cable')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Headphone style	', N'Over-ear')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Connection standard', N'3.5mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Impedance', N'327x101x42mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Wire', N'1.8m long')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'HP008', N'Feature', N'Multi-device connection')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC004', N'Trademark', N'Corsair')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC004', N'Material', N'Leatherette')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC004', N'Weight', N'120Kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC004', N'Height	', N'196cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC004', N'Armrest', N'4D')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'GC004', N'Chair size', N'56cm x 58cm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS014', N'Trademark', N'Asus')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS014', N'Sensor', N'PAW3335')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS014', N'DPI', N'16000DPI')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS014', N'Frequency of sending mouse signals to the computer', N'1000 Hz')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS014', N'Switch', N'ROG 70M Micro Switch')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'MS014', N'Connect', N'USB 2.0')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT004', N'Battery life', N' Battery life up to 48 hours of use (no lights on, vibration off)')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'CT004', N'Screen', N' 1.3inch with 128x40 resolution, 2 gray levels')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'Trademark', N'Akko')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'Connect', N'USB Type-C, detachable')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'Number of keys	', N'98 Keys')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'LED', N'RGB background (Backlit, SMT bottom without switch) with many modes')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'Size', N'382 x 134 x 40 mm')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'Weight 	', N'1.1kg')
INSERT [dbo].[Product_Attribute] ([pro_id], [feature], [description]) VALUES (N'KB009', N'Switch	', N'AKKO CS Silver')
GO
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717921892/Products/Keyboard/ywkxnxta6noyaojpmnrb.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717921996/Products/Keyboard/pyttp822qidum7t1twrr.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922015/Products/Keyboard/eui0euacsjqhpa6hrayt.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922030/Products/Keyboard/wwwocxbhmhxhy0t9rvru.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922113/Products/Keyboard/fka2rubjgwdefmhvrdos.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922190/Products/Keyboard/e9sawikerlz0kw2lquhl.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922202/Products/Keyboard/jtqdkratpsxokxwkqjog.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922216/Products/Keyboard/zg6ioknni2duvji2puok.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922248/Products/Keyboard/hr7g8phxsb8xfybimmf7.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922280/Products/Keyboard/jurcj10bdnr2pkjymujo.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922294/Products/Keyboard/fjts0sokzhiva33he1az.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922305/Products/Keyboard/fvu3swa7bh30m4nkkb18.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922346/Products/Keyboard/vpkbhpxqjxbxzacshoia.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922380/Products/Keyboard/u6zvauadyrerizetn59v.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922420/Products/Keyboard/hlaf0rna1tgdcnwd9wyy.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922435/Products/Keyboard/wc5rkr8zvd0bt1ih2ci7.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922464/Products/Keyboard/tweavgjpejduj0v8fwv9.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922476/Products/Keyboard/scu51fazdl6tlwosvjig.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922488/Products/Keyboard/g5qkjacnjipkpnlh1ohf.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922519/Products/Keyboard/bcithwfksf6tbk6i3ivi.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922536/Products/Keyboard/p0bydvsaj7qkbgjt3xit.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922553/Products/Keyboard/i0a6x04nx9yodis6ygwg.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922578/Products/Keyboard/zmy1x4itrnpibw83tbvm.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922603/Products/Keyboard/asbjbkvfnikenkwll156.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922620/Products/Keyboard/vtr63ngchmblratpatqs.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924769/Products/Controller/qutk9vonjj39mvlwehuf.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924787/Products/Controller/fw45gyha5cgfmympydwb.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924802/Products/Controller/zyzz156z9ii0fpe1bc6q.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924811/Products/Controller/rbiyyqkrtsu7yp7fdivt.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924824/Products/Controller/b7ovbngq6xeroykeas8j.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924831/Products/Controller/fxysr9h7sn5hai0vvo3t.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924841/Products/Controller/shmkoxpgunprcqjribhq.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924846/Products/Controller/wzsg4qsbtctwfpyzfo1f.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924853/Products/Controller/zutrmelcspchnoehlm5c.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924877/Products/Controller/jxkhexqcllxwm65aurcb.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924890/Products/Controller/jdmuulygohhnhfdny6d7.png')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924899/Products/Controller/xynykmjy1dclfd7zs9d4.png')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924907/Products/Controller/dopzxlhlstarzoqwtn5s.png')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924923/Products/Controller/mqzeyfkk6kzh1vom0our.png')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924936/Products/Controller/obyvnzjnya5sakdfba4q.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924942/Products/Controller/jmgxuf8hxqjd6p5mxok2.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924959/Products/Controller/e45f1h04byzdvdzk4zzo.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924967/Products/Controller/ttpstsgf37d0i4vdlz6g.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'CT004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924980/Products/Controller/olodpx1jnxwydpnliyid.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928907/Products/GamingChairs/z5hzmap76ivbbfxycj8b.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928916/Products/GamingChairs/yoybyil1wyzdfcutq3qw.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928925/Products/GamingChairs/syg6aqccmexvqsfjik3k.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928937/Products/GamingChairs/djo58phlzad9xef5jijr.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928945/Products/GamingChairs/jgsgzq1sscfwtqw6rduq.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928968/Products/GamingChairs/ppf6kqt8src7nnkdhvnz.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928975/Products/GamingChairs/x80o2ptqik8ivna21ecu.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717928987/Products/GamingChairs/mrdgigbyi3saf394gmvm.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929010/Products/GamingChairs/witqzgy8058bbnyreioi.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929025/Products/GamingChairs/p5cpb5webp9v6b64dsbr.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929034/Products/GamingChairs/mjux9kkppegkmnrmvqwx.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929044/Products/GamingChairs/wgu48tvjujgjikp2tbfn.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929057/Products/GamingChairs/dukw1cw1g3xprnpzg1z2.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929066/Products/GamingChairs/zymtywd00sezrnj2xhh4.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929080/Products/GamingChairs/lwqvttntlpzjic7cvyfk.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929086/Products/GamingChairs/yn4tfqxcatqlnseutebl.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'GC004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929097/Products/GamingChairs/by0cq5p6hl253udygfgm.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922632/Products/Keyboard/sbnpr0e0y3ollge0lflw.webp
')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922641/Products/Keyboard/yr2kcczh8duvnu02hofo.webp
')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922677/Products/Keyboard/mn9a5w7umabkyg1tgplt.webp
')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922660/Products/Keyboard/wcjmdpb9kwlfbucttj7d.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922962/Products/Keyboard/vyikxjpzjegxqwln7blt.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922972/Products/Keyboard/pjhqkyv1xlbanfcm4ctj.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717922989/Products/Keyboard/iyg3amady0wjixg6istg.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923012/Products/Keyboard/wscqeir6g21ldtvuysz6.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923032/Products/Keyboard/ib0wnl8mvmjntzufgvah.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923046/Products/Keyboard/hgbjc67rrx6pkbv1illm.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923056/Products/Keyboard/idhz1fau2x98ju9dojcm.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923071/Products/Keyboard/gaapkk1sq6km9ub8d6om.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923084/Products/Keyboard/ynecq3efezwblellfhoa.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923097/Products/Keyboard/fxczch4zcyphznps6dik.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'KB009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923106/Products/Keyboard/zxw6z7w9hekhjjvv5nfp.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923837/Products/Mouse/ogckqbmnbhndhsijyvgb.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923851/Products/Mouse/mh2dzld2pvh4yewlbsgv.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923860/Products/Mouse/g7sfyjiwemq5jsfrrsdx.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923876/Products/Mouse/gbohtzemnyar5ltrzumq.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923887/Products/Mouse/pimqmbyyg0eaja5yzdbo.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923899/Products/Mouse/i3q1wz6vikgfjishd8ox.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923911/Products/Mouse/pvfkuh0h1h6qcuy4npwo.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923925/Products/Mouse/tiikqco09qpqbst0jxsm.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717923993/Products/Mouse/wbddsx39yxnxxecadtla.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924011/Products/Mouse/mq6wq526xtabssxcejyl.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924026/Products/Mouse/mm2wufq59qpsj3fbl0fx.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924034/Products/Mouse/z7onxpngxtjo4ogrsap1.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924051/Products/Mouse/y91dlwdum1htpziwhnvr.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924064/Products/Mouse/gf2cbbab8q2wclpbmlid.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924075/Products/Mouse/zsa8kir9nkrd6ev5uogq.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924131/Products/Mouse/ikhwvha7scorksgmss7q.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924146/Products/Mouse/zffgimwmesrf9rhbleqt.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924156/Products/Mouse/wt008mjitxxrzbwaaebw.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924169/Products/Mouse/zxkzsw91dzxpusmz6k0b.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924176/Products/Mouse/rns1sxypzutuyoff8eow.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924194/Products/Mouse/xrnh5u1udlntotulqr6p.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924203/Products/Mouse/tla89xszkqvpja9pxwgi.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924223/Products/Mouse/tv49ctvl2scvnvyjxmhl.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924236/Products/Mouse/med8n7itoibqiormxkxn.webp')
GO
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924256/Products/Mouse/cwr7fjk480xhzeeap4bv.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924263/Products/Mouse/foctdwx0miheczdu7kzm.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924277/Products/Mouse/dmk3qjw55ncbastfqnus.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924287/Products/Mouse/lb5o5ex8gmfqtcd9xmcc.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924300/Products/Mouse/zfozaapj1y5ozxprpiyo.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924310/Products/Mouse/ootlyereeqrh7vcho1ym.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924322/Products/Mouse/ys5wifkm7gd0zgvowg5e.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS009', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924332/Products/Mouse/pehzrwnfhmb5ktqkm6o1.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS010', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924351/Products/Mouse/jluq7rg1x8lw2fco8vmo.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS010', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924359/Products/Mouse/te0ozggoxkkp4kd2las7.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS010', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924375/Products/Mouse/h1jyr5zqngosupa47yif.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS010', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924384/Products/Mouse/kmboz2k2aw48j7jnhjj1.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS011', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924403/Products/Mouse/vwmmkui6y0zbx4t17yaz.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS011', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924411/Products/Mouse/xem9xiuodspxjshrqqid.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS011', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924423/Products/Mouse/jexpjtwjr5rdjjacdkmb.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS011', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924429/Products/Mouse/ncxopaaxhiwebpfnxf0e.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS012', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924446/Products/Mouse/almreanydefhqs1hr7n6.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS012', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924453/Products/Mouse/zh23cddgcjefo1pstkdu.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS012', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924468/Products/Mouse/s8wkirzpnvt6ssq9pruh.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS012', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924475/Products/Mouse/t9kq5jdpvpdcaizjmks4.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS013', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924488/Products/Mouse/hxsxgi5rziw4zcfnzofl.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS013', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924502/Products/Mouse/mkitwfich6awxyamu43q.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS013', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924512/Products/Mouse/ygoxorhkpuqdtpewrtmb.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS013', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924527/Products/Mouse/ma1j6q5mz2mvlwbgvhlf.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS014', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924568/Products/Mouse/hqulprif1jqffz7ruek1.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS014', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924579/Products/Mouse/fywv0tdywb8dvxejlv7x.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS014', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924584/Products/Mouse/t7pecfc4yujihe7udikn.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS015', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924602/Products/Mouse/iooa4ix4h5zvqd55ir8k.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS015', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924634/Products/Mouse/ghjyccnutleag4yh81ku.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS015', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924641/Products/Mouse/gxgwx3ehntub5urxmrlu.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS015', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924653/Products/Mouse/mdrw5tnbdy5nad8p71dc.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'MS015', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717924663/Products/Mouse/dmkpoywae6zhllbuwqpv.jpg')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929167/Products/Headphone/d2gelzkvqwtxjrk2k78e.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929180/Products/Headphone/ylrizddrkbabzdxf3vij.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929190/Products/Headphone/v8kuyod45bwz4ojur0rp.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP001', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929205/Products/Headphone/usmn9qzwkskaqcwsohwe.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929217/Products/Headphone/jhd6bvenplr1wsoavd7o.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929229/Products/Headphone/hvruppntf0xlwoe91xdn.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929246/Products/Headphone/cvevbk5s7tqdpbn6jndt.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP002', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929258/Products/Headphone/rb5c77trt3nuscycbwpc.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929268/Products/Headphone/wzgprpn1n2suyagytpjc.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP003', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929281/Products/Headphone/yh3kt6fdc5ixwmjhmqw7.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929290/Products/Headphone/zwwd85eqpljkmzlk8zqq.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP004', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929303/Products/Headphone/okfcvvoyuj2r2ql3higr.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929314/Products/Headphone/mlkr3brgphruywuux571.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929325/Products/Headphone/koh6ge2ihunt03ifbwvw.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929339/Products/Headphone/kmozr0qh55wxvrgd3gk2.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929350/Products/Headphone/jqpmvtibhypgidqiqmui.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP005', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929358/Products/Headphone/zhnviguafglskv68alrw.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929419/Products/Headphone/ntgk0awspf8vrph35w56.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929429/Products/Headphone/vygwsbukcgvpby15jgcf.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP006', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929440/Products/Headphone/aievxm2awg4moqbb9iid.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929456/Products/Headphone/mgvi17fbjcpwy7k8axho.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929465/Products/Headphone/oceq8tiyebyqrsqgl2us.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929476/Products/Headphone/qzppjvjq8xltbq4hptdy.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929490/Products/Headphone/aps2cmb3lcbswikwzuic.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP007', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929502/Products/Headphone/pebtjnaxetedndajonf3.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929517/Products/Headphone/rpzpeyqyfmepb4nj74ko.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929531/Products/Headphone/kketsifot5lqj77o2q2i.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929544/Products/Headphone/c3ag1b8yrbqhnaekmedc.webp')
INSERT [dbo].[Product_Image] ([pro_id], [pro_img]) VALUES (N'HP008', N'https://res.cloudinary.com/dklkzeill/image/upload/v1717929553/Products/Headphone/ntjunuswcydjaduutpv3.webp')
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [cart_pro_id_foreign] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [cart_pro_id_foreign]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [cart_username_foreign] FOREIGN KEY([username])
REFERENCES [dbo].[Customer] ([username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [cart_username_foreign]
GO
ALTER TABLE [dbo].[Delivery_address]  WITH CHECK ADD  CONSTRAINT [delivery_address_username_foreign] FOREIGN KEY([username])
REFERENCES [dbo].[Customer] ([username])
GO
ALTER TABLE [dbo].[Delivery_address] CHECK CONSTRAINT [delivery_address_username_foreign]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [order_manager_id_foreign] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Manager] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [order_manager_id_foreign]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [order_username_foreign] FOREIGN KEY([username])
REFERENCES [dbo].[Customer] ([username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [order_username_foreign]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [order_detail_order_id_foreign] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [order_detail_order_id_foreign]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [order_detail_pro_id_foreign] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [order_detail_pro_id_foreign]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_brand_id_foreign] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_brand_id_foreign]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_cate_id_foreign] FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([cate_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_cate_id_foreign]
GO
ALTER TABLE [dbo].[Product_Attribute]  WITH CHECK ADD  CONSTRAINT [product_attribute_pro_id_foreign] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Product_Attribute] CHECK CONSTRAINT [product_attribute_pro_id_foreign]
GO
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD  CONSTRAINT [product_image_pro_id_foreign] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Product_Image] CHECK CONSTRAINT [product_image_pro_id_foreign]
GO
ALTER TABLE [dbo].[Receipt_Product]  WITH CHECK ADD  CONSTRAINT [receipt_product_pro_id_foreign] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Receipt_Product] CHECK CONSTRAINT [receipt_product_pro_id_foreign]
GO
ALTER TABLE [dbo].[Receipt_Product]  WITH CHECK ADD  CONSTRAINT [receipt_product_receipt_id_foreign] FOREIGN KEY([receipt_id])
REFERENCES [dbo].[Import_Product] ([receipt_id])
GO
ALTER TABLE [dbo].[Receipt_Product] CHECK CONSTRAINT [receipt_product_receipt_id_foreign]
GO
