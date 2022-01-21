/*
Cleaning Data in SQL Queries
*/


Select *
From Portfolio_Project..NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

Select SaleDateCoverted, CONVERT(date, SaleDate) as SaleDateCoverted
From Portfolio_Project..NashvilleHousing

update NashvilleHousing 
set SaleDate = CONVERT(date, SaleDate)

alter table NashvilleHousing 
add SaleDateCoverted Date;


update NashvilleHousing 
set SaleDateCoverted =   CONVERT(date, SaleDate)


 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select *
From Portfolio_Project..NashvilleHousing
--where PropertyAddress is null
order by parcelID	


Select a.ParcelID, a.PropertyAddress,  b.ParcelID, b.PropertyAddress , iSNULL( a.PropertyAddress ,b.PropertyAddress)
From Portfolio_Project..NashvilleHousing a
JOIN Portfolio_Project..NashvilleHousing b
     on a.parcelID = b.parcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null


update a
set PropertyAddress =  iSNULL( a.PropertyAddress ,b.PropertyAddress)
From Portfolio_Project..NashvilleHousing a
JOIN Portfolio_Project..NashvilleHousing b
     on a.parcelID = b.parcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null



--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)


Select *
From Portfolio_Project..NashvilleHousing


































