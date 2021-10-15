
CREATE SCHEMA inventorydb /* SQLINES DEMO *** RACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /* SQLINES DEMO *** RYPTION='N' */;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE inventorydb.products_seq;

CREATE TABLE inventorydb.products (
  productId INT NOT NULL DEFAULT NEXTVAL ('inventorydb.products_seq'),
  manufacturer VARCHAR(255) NOT NULL,
  sku VARCHAR(60) NOT NULL,
  upc VARCHAR(60) NOT NULL,
  pricePerUnit DECIMAL(13,2) NOT NULL,
  quantityOnHand INT NOT NULL,
  productName VARCHAR(255) NOT NULL,
  PRIMARY KEY (productId));


INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Johns-Jenkins','p5z343vdS','939581000000',497.45,9703,'sticky note');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Hessel, Schimmel and Feeney','i7v300kmx','740979000000',282.29,9217,'leg warmers');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Swaniawski, Bartoletti and Bruen','q0L657ys7','111730000000',436.26,5905,'lamp shade');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Runolfsdottir, Littel and Dicki','x78426lq1','93986215015',537.90,2642,'flowers');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Kuhn, Cronin and Spencer','r4X793mdR','260149000000',112.10,6144,'clamp');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Quigley, Casper and Boyer','g2P499xrM','390162000000',593.53,6507,'twister');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Gutmann and Sons','v4j250hbi','465922000000',88.97,4348,'clay pot');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Bins-Hansen','d3E278nk2','20072026056',933.35,4577,'tooth picks');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Jones, Braun and Ratke','o3w911oal','879638000000',426.23,1882,'mirror');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Upton-Mraz','k0R875prt','877387000000',630.61,4036,'rug');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Schneider, Douglas and Franecki','h3t822kaB','507019000000',13.67,2285,'headphones');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Weimann, Waelchi and Kassulke','t8A474iuv','669100000000',369.46,5409,'balloon');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Moore-Gibson','c4i321mvh','600535000000',250.98,6219,'lip gloss');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Schuppe, Cummerata and Hammes','l9V771xw1','677102000000',577.90,1104,'sidewalk');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Ward-Quigley','x7b275hk2','110459000000',642.19,9371,'pen');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Cassin Inc','b27590nys','920302000000',145.19,5382,'outlet');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Shanahan Inc','j4y570kml','850798000000',409.02,4567,'blanket');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Upton-Runolfsdottir','m2K116lkV','10335859487',815.26,7083,'lotion');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Lubowitz Group','w61375szc','286418000000',700.53,2224,'socks');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Padberg, Grady and Mueller','f1D653dwZ','62442197606',176.67,4544,'CD');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Barrows-Gibson','g5F556bj2','667449000000',66.44,138,'model car');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Feeney, Glover and Johns','o72175oxZ','353375000000',454.12,4712,'soda can');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Ankunding, Haag and Corwin','n5m968dmo','356116000000',852.15,5325,'fridge');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Armstrong, Mohr and Bradtke','o6O935rpv','451505000000',275.21,7339,'bottle cap');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Schmidt and Sons','j32187bai','393839000000',425.45,5434,'photo album');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Fadel, Robel and Turner','g7K279msW','227667000000',774.24,2224,'twezzers');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Cassin, Kreiger and Wisoky','o4o723dsy','663345000000',899.61,3985,'glow stick');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Baumbach LLC','m8p061fi3','156939000000',663.10,9644,'truck');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Cummerata, Hills and Anderson','v4d029mtP','130529000000',223.74,4173,'purse');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Kautzer, Bradtke and Stracke','i2w704pvs','498143000000',929.37,1465,'bowl');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Bernhard, Fisher and Reinger','p8A041wxj','302419000000',935.96,7069,'sketch pad');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Stamm and Sons','i1q225viC','190041000000',341.29,9364,'sponge');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Senger Group','y6u840ste','981691000000',785.00,9635,'cookie jar');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Conroy-Little','i2b810vfi','151356000000',956.12,8016,'sharpie');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Huels Inc','r2Y361mak','315225000000',78.00,8471,'shawl');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Pacocha and Sons','m6f710dvL','54158362672',392.98,5583,'face wash');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Bednar, Bednar and Skiles','d3l280ulV','916805000000',761.49,5408,'toothpaste');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Pouros Group','h9z038nu2','213707000000',49.02,8531,'ring');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Feil, Wehner and Russel','j9X185vnN','959689000000',828.92,3896,'door');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Mayert, Barton and Feeney','b9J149udy','377314000000',863.18,1618,'towel');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Lindgren and Sons','d5X474kg4','544254000000',139.86,7135,'vase');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Lueilwitz-Stehr','b81957uq9','766152000000',758.59,352,'sun glasses');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Goldner, Bogisich and Zieme','o1O578rpk','541391000000',146.27,332,'soy sauce packet');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Braun-Auer','o1d743wqj','234837000000',205.50,6497,'thermostat');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Block, Wehner and Mann','a7b451lhB','211640000000',658.75,795,'playing card');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Jenkins, Hickle and Zemlak','a7F511yoM','262647000000',0.95,7017,'camera');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Cassin, Jaskolski and Glover','l2D749trK','507953000000',414.79,2005,'key chain');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Hermiston and Sons','u12812ak7','412832000000',848.51,5802,'zipper');  
INSERT INTO inventorydb.products (manufacturer, sku, upc, pricePerUnit, quantityOnHand, productName) VALUES ('Ankunding Group','n6K818cdd','726622000000',450.32,4164,'ipod');  