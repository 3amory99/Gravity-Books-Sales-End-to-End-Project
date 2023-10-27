# Gravity Books Sales End-to-End Project
![Logo](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/gravity%20logo.png)
## Table of Contents
- [Introduction](#introduction)
- [Project Phases](#project-phases)
- [Data Source](#data-source)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [ETL Phase](#etl-phase)
- [Analysis Phase](#analysis-phase)
- [Reporting Phase](#reporting-phase)
- [Contributing](#contributing)
- [License](#license)

## Introduction
Welcome to the Gravity Books Sales End-to-End Project repository. This project is an exemplary demonstration of a complete data warehousing solution, encompassing the Extract, Transform, Load (ETL) phase, analysis phase with SQL Server Analysis Services (SSAS), and reporting phase using Pivot Table and Power BI.

## Project Phases
1. **ETL (Extract, Transform, Load)**: In this phase, data is extracted from a transactional database called "Gravity Book Sales," transformed to meet data warehousing requirements, and loaded into a structured data warehouse.
2. **Analysis**: The data is modeled and structured for efficient querying and analysis using SQL Server Analysis Services (SSAS).
3. **Reporting**: Interactive reports and visualizations are created using Pivot Table in Excel and Power BI, allowing end-users to derive insights from the data.

## Data Source
The source dataset for this project is the "Gravity Book Sales" database, which can be found [here](https://github.com/bbrumm/databasestar/tree/main/sample_databases/sample_db_gravity/gravity_sqlserver). This transactional database serves as the foundation for the end-to-end project.

## Technologies Used
- SQL Server Integration Services (SSIS)
- SQL Server Analysis Services (SSAS)
- Pivot Table (Excel)
- Power BI

## Getting Started
To explore and replicate the project, follow these steps:
1. Clone this repository to your local machine.
2. [Download and install SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) if not already installed.
3. Follow the instructions in the respective folders for each project phase (ETL, Analysis, Reporting) to set up and execute the code.

## ETL Phase


* DDL statements of table creation and the DWH Schema
  
  * Customer Dimension
    
    ![DDL Customer Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Customer%20Dim.PNG)
    
  * Book Dimension
    
    ![DDL Book Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Book%20Dim.PNG)
    
   * Shipping Dimension
     
    ![DDL Shipping Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Shipping%20Dim.PNG)
  
   * Date Dimension
     
    ![DDL Date Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Date%20Dim.PNG)






* Detailed instructions for the ETL phase can be found in the [ETL folder](/ETL).

   * Customer Dimension
   
    ![ETL Customer Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Customer%20Dim.PNG)

   * Book Dimension
   
    ![ETL Book Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Book%20Dim.PNG)

   * Shipping Dimension
   
    ![ETL Shipping Dim](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Shipping%20Dim.PNG)

   * Fact Table Full Load
   
    ![ETL Fact Table Full Load](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/ETL%20Fact%20Table%20Full%20Load.PNG)

## Analysis Phase
To explore the analysis phase, refer to the [Analysis folder](/Analysis).

This project harnesses the power of SQL Server Analysis Services (SSAS) for advanced data modeling and analysis. In particular, we've employed the Tabular mode of OLAP (Online Analytical Processing) to create efficient data models that cater to our analytical needs.

- **Tabular Mode:** We've chosen to work with the Tabular mode in SSAS. This mode specializes in constructing tabular data models, which provide a streamlined, relational view of the data. It excels in scenarios where data retrieval speed and simplicity are top priorities.

    ![SSAS OLAP](https://github.com/3amory99/Gravity-Books-Sales-End-to-End-Project/blob/master/Project%20Screenshots/Cube%20Browsing%20OLAP.PNG)


## Reporting Phase
For reporting and visualization using Pivot Table and Power BI, visit the [Reporting folder](/Reporting).

## Contributing
We welcome contributions! If you'd like to improve this project or fix issues, please open a pull request. For major changes, please open an issue to discuss changes and ensure compatibility with the project's vision.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to adapt and expand upon this template to provide all the necessary details, instructions, and context for your "Gravity Books Sales End-to-End Project" repository. An informative README.md helps users understand and engage with your project effectively.
