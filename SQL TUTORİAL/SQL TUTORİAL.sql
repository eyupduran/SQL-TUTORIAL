                      --SELECT 
select * from Customers --(tüm müşterileri göster)
SELECT customerID FROM Customers--(müşterilerdeki customerIdi al )

                     --SELECT DISTINCT
 SELECT DISTINCT City FROM customers--(distinct aynı değerleri tek bir kez yazıyor)
SELECT DISTINCT country FROM customers--(iki tane aynı isimli şehirleri tek bir tane gösteriyor)

                        --COUNT
SELECT COUNT(DISTINCT country) FROM customers(count komutu veri sayısını veriyor)
select count(*) from Customers (count (özellikle sayısını öğrenmek istediğimiz))
select count (customerId) from customers

                        --WHERE
--where komutu şart komutumuz 
SELECT * FROM Customers WHERE Country='Germany'--(şehri Almanya olanları getir)
SELECT * FROM Customers WHERE ContactName != 'Thomas Hardy'
select customerId from customers where customerId='Bottm'
select count(*) from products where categoryId=1 and UnitPrice<=18
--(sonuç olarak where komutundan sonra aratmak istediğimz şartı yazıp aratıyoruz)



                       --AND-OR-NOT
SELECT * FROM Customers WHERE NOT Country='Germany'
select UnitsInStock, reorderlevel from products where UnitsInStock<20 and ReorderLevel>20



                       --ORDER BY
SELECT * FROM Customers WHERE NOT Country='Germany' order by country--(şehri almanya olmayan müşterilerin şehirlerini sırala)
SELECT * FROM Customers WHERE NOT Country= 'Berlin' order by country ASC/DESC
select UnitPrice from  products where unitprice > 6 order by unitprice desc
select postalcode from customers order by PostalCode desc
SELECT  Country, Address FROM Customers ORDER BY Country, Address
SELECT * FROM Customers,Products where not city='berlin' and not CategoryID=1 order by  Region desc
--(order by dan sonra desc yazsak büyükten küçüğe işlem yapar, asc da tam tersi işlem yapar )



                        --INSERT INTO
INSERT INTO Customers (companyName,customerId, City, Country)
VALUES ('btk' ,5, 'Cardinal' , 'istanbul')
--insert into da eleman ekleme işlemini yapıyoruz
select * from customers where country = 'istanbul'
--eklediğim elemanı aradığım kısım



                           --NULL 
select * from customers where region is null --( = null yerine, is null kullanılması gerekiyor)


                           --UPDATE 
UPDATE products SET UnitPrice =10 , UnitsInStock= 5 WHERE ProductId = 1--( Update kullanımı - tablodaki bir veriyi güncelleme)
select * from products


                           --DELETE
DELETE FROM products where ProductName='Chai' --(Delete komutu - sartla belirttiğimiz kısmı siliyor)
select * from products


                         --TOP-PERCENT
SELECT TOP 3 * FROM Customers;--(customers tablosundaki ilk 3 elemanı getir )
SELECT TOP 50 PERCENT * FROM Customers;--(tablodaki müşterilerin %50 sini gösterir)


                         --MIN() - MAX()
SELECT MIN(UnitPrice) AS SmallestPrice FROM Products; --(ürünlerdeki minimum ürün fiyatını getir ve adını tablo adını smallestprice yap)
SELECT MAX(SupplierID) AS LargestSupplierID FROM Products;--(aynı mantıkla max kullanımı)



                       --COUNT(), AVG() and SUM() 
SELECT COUNT(ProductID) FROM Products;-- (count ;içine yazdığımız ifadenin müktarını getiriyor)
SELECT AVG(UnitPrice) FROM Products-- (AVG ifadesi tüm ürünlerin ortalama fiyatını bulur)
SELECT SUM(UnitPrice) FROM Products where Unitprice > 10 -- (fiyatı 10 dan büyük olan ürünlerin toplam fiyatını getir  )
select sum(quantity) AS sumquantity from [Order Details] --(sipariş detayı tablosundaki ürünlerin toplam miktarını al ve adını sumquantity olarak değiştir )


                            --LIKE -WİLDCARDS
SELECT * FROM Customers WHERE city LIKE 'a%' (müşteriler listesinde adresi a ile başlayan müşterileri getir)
--'a%' -- a ile başlayan
--'%a' -- a ile biten
SELECT * FROM Customers WHERE CompanyName LIKE '%or%'--(müşterilerde şirket adında o ve r harfi bulananları getir)
SELECT * FROM Customers WHERE city LIKE '_ra%' --(müşterilerde şehir adında ra kelimesi bulunanları getir)
SELECT * FROM Customers WHERE CompanyName LIKE 'a__%';--("a" ile başlayan ve en az 3 karakter uzunluğunda olan CompanyName'e sahip tüm müşterileri seçer)
SELECT * FROM Customers WHERE CompanyName LIKE 'a%e'--("a" ile başlayan ve "e" ile biten bir CompanyName olan tüm müşterileri seçer:)
SELECT * FROM Customers WHERE city NOT LIKE 'a%'--(a ile başlamayan tüm müşterileri alır)
SELECT * FROM Customers WHERE City LIKE 'ber%'--("ber" ile başlayan şehirleri getir)
SELECT * FROM Customers WHERE City LIKE '%es%' --("es " harfleri bulunan şehirleri getir)
SELECT * FROM Customers WHERE City LIKE '_ondon';--('ondon' kelimesi bulunan şehirleri getir)
SELECT * FROM Customers WHERE ContactName LIKE '[bsp]%'--(contact name i b-s-p harflerinden biri olan müşterileri getir)
SELECT * FROM Customers WHERE City LIKE '[a-c]%';--(şehir adı a ile c harfleri arasında olan şehirleri getir)
SELECT * FROM Customers WHERE City not LIKE '[bsp]%';--(şehir ismi b-s-p harflerinden biri ile başlamayan şehirleri getir)



                            --IN 
--(IN operatörü, birden çok OR koşulu için bir kısaltmadır. )
select * from customers where city IN ('köln' , 'london')
 --(köln veya londra şehrindeki müşterileri al)
select*from products where ProductID IN(1,2,3)--(ürün id si 1-2-3 olan ürünleri getir)
SELECT * FROM Customers WHERE Country --  (tedarikçilerle aynı ülkelerden olan tüm müşterileri seçer:)
IN (SELECT Country FROM Suppliers) 


                              --BETWEEN 
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 20--(ürün fiyatı 10 ve 20 arasındaki ürünleri al)
--(NOT BETWEEN ise tam tersi işlemi uygular)
SELECT * FROM Products WHERE unitPrice BETWEEN 10 AND 20 AND CategoryID NOT IN (1,2,3)
--(ürün fiyatı 10 ve 20 arasında olup categoriıd si 1 2 3 olmayan ürünleri al)
SELECT * FROM Products WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName
--(Carnarvon Tigers ve Mozzarella di Giovanni ARASINDA ÜrünAdı olan tüm ürünleri seçer ve ürün adına göre sıralar)
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';
--(01 -Temmuz-1996 've '31 -Temmuz-1996' arasında bir OrderDate olan tüm siparişleri seçer)



                             --ALIASES(Takma Ad)

SELECT CustomerID AS ID, CompanyName AS Customer FROM Customers;
--(CustomerId i ID,CompanyName i customer olarak değiştiriyor)
SELECT CompanyName AS Customer, ContactName AS [Contact Person] FROM Customers;
--(CompanyName sütunu ve diğeri ContactName sütunu için olmak üzere iki takma ad oluşturur.)
SELECT CompanyName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address FROM Customers;
 --dört sütunu (Adres, Posta Kodu, Şehir ve Ülke) birleştiren "Adres" adlı bir takma ad oluşturur
select c.companyname from customers as c--(customers tablosunun adını c olarak kısaltıp kullanabiliriz)
 SELECT o.OrderID, o.OrderDate, c.CompanyName FROM Customers AS c, Orders AS o 
 WHERE c.CompanyName='Around the Horn' AND c.CustomerID=o.CustomerID
  --(Müşteri Kimliği = 4 (Korna Çevresi) ile müşteriden tüm siparişleri seçer. "Müşteriler" ve "Siparişler" tablolarını
-- kullanıyoruz ve onlara sırasıyla "c" ve "o" tablo takma adlarını veriyoruz  )
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName FROM Customers, Orders
WHERE Customers.CompanyName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;
 --(yukarıdakiyle aynı, ancak takma adlar kullanmadık)


                          --JOINS-LEFT JOIN-RİGHT JOIN-FULL OUTER JOIN
 
 --JOINS(iki tabloda eşleşen kısımları birleştirmeye yarıyor)
select * from products inner join Categories --(category ve products tablosunda category ıd leri aynı olanları geti)
on products.CategoryID =Categories.CategoryID 
--(birleştirme işlemi yapıyor, koşulumuzu on ile yazıyoruz)

select products.ProductID,products.ProductName,products.UnitPrice,Categories.CategoryName from products inner join Categories
on products.CategoryID =Categories.CategoryID  
--(yukarıdakiyle aynı kod sadece tablonun tümünü değil de bazı kısımları aldık)

select products.ProductID,products.ProductName,products.UnitPrice,Categories.Categoryname 
from products  inner join categories on products.categoryId=categories.categoryId where UnitPrice>10
--(ürünlerdeki kategoriıd leri ve categorideki categoriıd leri birleştirdi, ürünlerde fiyatı 10 dan büyük ürünleri categori ismiyle getiren sorgu )

select*from products p  left join [Order Details] od 
on p.ProductID=od.ProductID
--(solda olup sağda olmayanları da getir. yani ürün olup siparişi yapılmamışları getir)

select * from customers c inner join orders o
on c.CustomerID=o.CustomerID --(siparişi olan müşterileri getir)

select * from customers c left join orders o
on c.CustomerID=o.CustomerID--(müşteri olup sipaişi olmayanları da getir)

select * from customers c left join orders o
on c.CustomerID=o.CustomerID
where o.CustomerID is null--(ürün almayan müşterileri getir)

select * from [Order Details] od right join products p
on od.ProductID=p.ProductID--(ürün olup sipariş olmayan ürünleri de getir

SELECT Customers.CompanyName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CompanyName--(siparişi olur yada olmasın bütün müşterileri getir )


                        
                        --UNION - UNION ALL

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;
--(hem "Müşteriler" hem de "Tedarikçiler" tablosundaki şehirleri (yalnızca farklı değerler) döndürür:)
--unions bi nevi iki tane select ifadesinin aynı anda çalıştırılmasıdır diyebiliriz
--Bazı müşteriler veya tedarikçiler aynı şehre sahipse, her şehir yalnızca bir kez listelenir, 
--çünkü UNION yalnızca farklı değerler seçer.
--Yinelenen değerleri de seçmek için UNION ALL kullanın!

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;
--( hem "Müşteriler" hem de "Tedarikçiler" tablosundaki şehirleri (aynı zamanda yinelenen değerler) döndürür:)

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION 
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City 
--( hem "Müşteriler" hem de "Tedarikçiler" tablosundan Alman şehirlerini (yalnızca farklı değerler) döndürür)

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;--(tüm müşterileri ve tedarikçileri listeler:)

                             --GROUP BY --HAVİNG
select categoryId, count(*) from Products group by categoryId -- (bütün kategorileri tekrar etmeyecek şekilde listele)
--Kategory ıd eşit olan ürünlerin sayısını grupladık
--her kategori için ayrı ayrı grupla demek

select categoryId, count(*) from Products where UnitPrice>20 group by categoryId having  count(*) <10
--(WHERE anahtar sözcüğü toplama işlevleriyle kullanılamadığından HAVING yan tümcesi kullanılır)
-- birim fiyatı 20 den büyük ürünleri ve ürün çeşidi 10 dan az olan  kategorilere göre  grupla

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;
--her ülkedeki müşteri sayısını yüksekten düşüğe doğru sıralanmış olarak listeler

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5
--her ülkedeki müşteri sayısını listeler. Yalnızca 5'ten fazla müşterisi olan ülkeleri dahil eden komut

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25
--("Davolio" veya "Fuller" çalışanlarının 25'ten fazla sipariş kaydetmiş olup olmadığını listeler:)



            
                 --EXIST - ANY and ALL

SELECT companyName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND unitPrice < 20);
--(TRUE değerini döndürür ve 20'den düşük ürün fiyatı olan tedarikçileri listeler)

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);
--(TRUE değerini döndürür ve OrderDetails tablosunda miktar = 10 olan HERHANGİ bir kayıt bulursa ürün adlarını listeler:)

SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);
--(TRUE değerini döndürür ve OrderDetails tablosundaki TÜM kayıtların miktar = 10 olması durumunda ürün adlarını listeler (bu nedenle, OrderDetails
--tablosundaki TÜM kayıtlarda miktar = 10 olmadığı için bu örnek FALSE döndürür):)



                                 --SELECT INTO
SELECT * INTO CustomersBackup2017
FROM Customers; --( Müşterilerin yedek bir kopyasını oluşturur:)

SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;--(tabloyu başka bir veritabanındaki yeni bir tabloya kopyalamak için IN yan tümcesini kullanır:)

SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;--(yalnızca birkaç sütunu yeni bir tabloya kopyalar:)



                            --INSERT INTO SELECT
INSERT INTO Customers (CompanyName, City, Country)
SELECT CompanyName, City, Country FROM Suppliers;
--("Tedarikçiler" i "Müşteriler" e kopyalar (verilerle doldurulmayan sütunlar NULL içerecektir))

INSERT INTO Customers (CompanyName, ContactName, Address, City, PostalCode, Country)
SELECT CompanyName, ContactName, Address, City, PostalCode, Country FROM Suppliers;
--(Aşağıdaki SQL ifadesi "Tedarikçiler" i "Müşteriler" e kopyalar (tüm sütunları doldurun):)


                                   --CASE
SELECT CompanyName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);
--(müşterileri şehre göre sıralayacaktır. Ancak, Şehir NULL ise, Ülkeye göre sırala:)




