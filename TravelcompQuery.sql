--Select *
--from Customers
--where CustomerID= 10

--1. En �ok gezilen yer/yerler neresidir?
Select PlaceName,
       COUNT(*) as NumberofVisits
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
Group by PlaceName
Order by NumberofVisits Desc

--2. A�ustos ay�nda en �ok �al��an rehber/rehberler kimdir/kimlerdir?
Select g.FirstName + ' ' + g.LastName,
       COUNT(r.ReceiptDate)
From Receipts r
join ReceiptDetails rd ON r.ReceiptID = rd.ReceiptID
join Tours t ON  rd.TourID =t.TourID
join Guides g	ON t.EmployeeID = g.EmployeeID
Where Month(r.ReceiptDate) = 8
Group by  g.FirstName + ' ' + g.LastName

--3. Kad�n turistlerin gezdi�i yerleri, toplam ziyaret edilme say�lar�yla beraber listeleyin
Select PlaceName,
       COUNT(*) as NumberofVisits
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
join Receipts r on Rd.ReceiptID= r.ReceiptID
Join Customers c on r.CustomerID = c.CustomerID
where c.Gender='Female'
Group by PlaceName
Order by NumberofVisits Desc

--4. �ngiltere�den gelip de K�z Kulesi�ni gezen turistler kimlerdir?
Select Distinct c.FirstName + ' ' + C.LastName
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
join Receipts r on Rd.ReceiptID= r.ReceiptID
Join Customers c on r.CustomerID = c.CustomerID
where c.Country='England' and p.PlaceName ='K�z Kulesi'

--5. Gezilen yerler hangi y�lda ka� defa gezilmi�tir?
Select PlaceName,
	   Year(r.ReceiptDate),
       COUNT(*) as NumberofVisits
From ReceiptDetails rd
join Receipts r on rd.ReceiptID = r.ReceiptID
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
Group by PlaceName,Year(r.ReceiptDate)

--6. 2�den fazla tura rehberlik eden rehberlerin en �ok tan�tt�klar� yerler nelerdir?
Select TOP 1 p.PlaceName
From Guides g
join Tours t  ON g.EmployeeID =t.EmployeeID
join ToursAndPlaces tp ON t.TourID =tp.TourID
join Places p ON tp.PlaceID = p.PlaceID
Group by p.PlaceName
Having Count(g.EmployeeID) >2
Order by Count(g.EmployeeID) Desc

--7. �talyan turistler en �ok nereyi gezmi�tir?
Select p.PlaceName,
		Count(p.PlaceName)
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
join Receipts r on Rd.ReceiptID= r.ReceiptID
Join Customers c on r.CustomerID = c.CustomerID
Where c.Country='Italy'
Group by p.PlaceName

--8. Kapal� �ar���y� gezen en ya�l� turist kimdir?
Select c.FirstName + ' ' + c.LastName  
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
join Receipts r on Rd.ReceiptID= r.ReceiptID
Join Customers c on r.CustomerID = c.CustomerID
Where p.PlaceID =14

--9. Yunanistan�dan gelen Finlandiyal� turistin gezdi�i yerler nerelerdir?
Select c.FirstName + ' ' + c.LastName, p.PlaceName
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
join Receipts r on Rd.ReceiptID= r.ReceiptID
Join Customers c on r.CustomerID = c.CustomerID
Where c.Country ='Greece' and c.Nationality = 'Finnish'

--10. Dolmabah�e Saray��na en son giden turistler ve rehberi listeleyin.
Select c.FirstName+' '+ c.LastName, g.FirstName + ' ' + g.LastName
From ReceiptDetails rd
Join Tours t	ON rd.TourID = t.TourID
Join ToursAndPlaces tp ON t.TourID =tp.TourID
Join Places p ON  tp.PlaceID =p.PlaceID
join Receipts r on Rd.ReceiptID= r.ReceiptID
Join Customers c on r.CustomerID = c.CustomerID
join Guides g	ON t.EmployeeID = g.EmployeeID
where p.PlaceName='Dolmabah�e Saray�'
Order by r.ReceiptDate

