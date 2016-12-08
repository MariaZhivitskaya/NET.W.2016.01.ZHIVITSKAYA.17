CREATE TABLE [Shawarma] (
	ShawarmaId int NOT NULL identity,
	ShawarmaName varchar,
	CookingTime int NOT NULL,
  CONSTRAINT [PK_SHAWARMA] PRIMARY KEY CLUSTERED
  (
  [ShawarmaId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [IngredientCategory] (
	CategoryId int NOT NULL identity,
	CategoryName varchar NOT NULL,
  CONSTRAINT [PK_INGREDIENTCATEGORY] PRIMARY KEY CLUSTERED
  (
  [CategoryId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Ingredient] (
	IngredientId int NOT NULL identity,
	IngredientName varchar NOT NULL,
	TotalWeight int NOT NULL,
	CategoryId int NOT NULL,
  CONSTRAINT [PK_INGREDIENT] PRIMARY KEY CLUSTERED
  (
  [IngredientId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ShawarmaRecipe] (
	ShawarmaRecipeId int NOT NULL identity,
	ShawarmaId int NOT NULL,
	IngredientId int NOT NULL,
	Weight int NOT NULL,
  CONSTRAINT [PK_SHAWARMARECIPE] PRIMARY KEY CLUSTERED
  (
  [ShawarmaRecipeId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SellingPointCategory] (
	SellingPointCategoryId int NOT NULL identity,
	SellingPointCategoryName varchar NOT NULL,
  CONSTRAINT [PK_SELLINGPOINTCATEGORY] PRIMARY KEY CLUSTERED
  (
  [SellingPointCategoryId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SellingPoint] (
	SellingPointId int NOT NULL identity,
	Address varchar NOT NULL,
	SellingPointCategoryId int NOT NULL,
	ShawarmaTitle varchar NOT NULL,
  CONSTRAINT [PK_SELLINGPOINT] PRIMARY KEY CLUSTERED
  (
  [SellingPointId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [PriceController] (
	PriceControllerId int NOT NULL identity,
	ShawarmaId int NOT NULL,
	Price decimal NOT NULL,
	SellingPointId int NOT NULL,
	Comment text,
  CONSTRAINT [PK_PRICECONTROLLER] PRIMARY KEY CLUSTERED
  (
  [PriceControllerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Seller] (
	SellerId int NOT NULL identity,
	SellerName varchar NOT NULL,
	SellingPointId int NOT NULL,
  CONSTRAINT [PK_SELLER] PRIMARY KEY CLUSTERED
  (
  [SellerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [TimeController] (
	TimeControllerId int NOT NULL identity,
	SellerId int NOT NULL,
	WorkStart datetime NOT NULL,
	WorkEnd datetime NOT NULL,
  CONSTRAINT [PK_TIMECONTROLLER] PRIMARY KEY CLUSTERED
  (
  [TimeControllerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [OrderHeader] (
	OrderHeaderId int NOT NULL identity,
	OrderDate date NOT NULL,
	SellerId int NOT NULL,
  CONSTRAINT [PK_ORDERHEADER] PRIMARY KEY CLUSTERED
  (
  [OrderHeaderId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [OrderDetails] (
	OrderHeaderId int NOT NULL identity,
	ShawarmaId int NOT NULL,
	Quantity int NOT NULL
)
GO


ALTER TABLE [Ingredient] WITH CHECK ADD CONSTRAINT [Ingredient_fk0] FOREIGN KEY ([CategoryId]) REFERENCES [IngredientCategory]([CategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [Ingredient] CHECK CONSTRAINT [Ingredient_fk0]
GO

ALTER TABLE [ShawarmaRecipe] WITH CHECK ADD CONSTRAINT [ShawarmaRecipe_fk0] FOREIGN KEY ([ShawarmaId]) REFERENCES [Shawarma]([ShawarmaId])
ON UPDATE CASCADE
GO
ALTER TABLE [ShawarmaRecipe] CHECK CONSTRAINT [ShawarmaRecipe_fk0]
GO
ALTER TABLE [ShawarmaRecipe] WITH CHECK ADD CONSTRAINT [ShawarmaRecipe_fk1] FOREIGN KEY ([IngredientId]) REFERENCES [Ingredient]([IngredientId])
ON UPDATE CASCADE
GO
ALTER TABLE [ShawarmaRecipe] CHECK CONSTRAINT [ShawarmaRecipe_fk1]
GO


ALTER TABLE [SellingPoint] WITH CHECK ADD CONSTRAINT [SellingPoint_fk0] FOREIGN KEY ([SellingPointCategoryId]) REFERENCES [SellingPointCategory]([SellingPointCategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [SellingPoint] CHECK CONSTRAINT [SellingPoint_fk0]
GO

ALTER TABLE [PriceController] WITH CHECK ADD CONSTRAINT [PriceController_fk0] FOREIGN KEY ([ShawarmaId]) REFERENCES [Shawarma]([ShawarmaId])
ON UPDATE CASCADE
GO
ALTER TABLE [PriceController] CHECK CONSTRAINT [PriceController_fk0]
GO
ALTER TABLE [PriceController] WITH CHECK ADD CONSTRAINT [PriceController_fk1] FOREIGN KEY ([SellingPointId]) REFERENCES [SellingPoint]([SellingPointId])
ON UPDATE CASCADE
GO
ALTER TABLE [PriceController] CHECK CONSTRAINT [PriceController_fk1]
GO

ALTER TABLE [Seller] WITH CHECK ADD CONSTRAINT [Seller_fk0] FOREIGN KEY ([SellingPointId]) REFERENCES [SellingPoint]([SellingPointId])
ON UPDATE CASCADE
GO
ALTER TABLE [Seller] CHECK CONSTRAINT [Seller_fk0]
GO

ALTER TABLE [TimeController] WITH CHECK ADD CONSTRAINT [TimeController_fk0] FOREIGN KEY ([SellerId]) REFERENCES [Seller]([SellerId])
ON UPDATE CASCADE
GO
ALTER TABLE [TimeController] CHECK CONSTRAINT [TimeController_fk0]
GO

ALTER TABLE [OrderHeader] WITH CHECK ADD CONSTRAINT [OrderHeader_fk0] FOREIGN KEY ([SellerId]) REFERENCES [Seller]([SellerId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderHeader] CHECK CONSTRAINT [OrderHeader_fk0]
GO

ALTER TABLE [OrderDetails] WITH CHECK ADD CONSTRAINT [OrderDetails_fk0] FOREIGN KEY ([OrderHeaderId]) REFERENCES [OrderHeader]([OrderHeaderId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [OrderDetails_fk0]
GO
ALTER TABLE [OrderDetails] WITH CHECK ADD CONSTRAINT [OrderDetails_fk1] FOREIGN KEY ([ShawarmaId]) REFERENCES [Shawarma]([ShawarmaId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [OrderDetails_fk1]
GO
