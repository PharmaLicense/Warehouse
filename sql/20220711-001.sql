
CREATE TABLE warehouse.Address 
    (
     ADDRESS_ID VARCHAR (36) NOT NULL 
    )
GO

ALTER TABLE warehouse.Address ADD CONSTRAINT Address_PK PRIMARY KEY CLUSTERED (ADDRESS_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Billing_Schedule 
    (
     Project_Forecast_Project_Forecast_ID NUMERIC (28) NOT NULL , 
     Statement_of_Work_Statement_of_Work_ID NUMERIC (28) NOT NULL 
    )
GO

CREATE TABLE warehouse.Budget_Status 
    (
     BUDGET_STATUS_ID VARCHAR (36) NOT NULL , 
     Shortcode VARCHAR (max) , 
     Status VARCHAR (max) 
    )
GO

ALTER TABLE warehouse.Budget_Status ADD CONSTRAINT Budget_Status_PK PRIMARY KEY CLUSTERED (BUDGET_STATUS_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Business_Unit 
    (
     BUSINESS_UNIT_ID VARCHAR (36) , 
     Shortcode VARCHAR (4) NOT NULL , 
     Name VARCHAR (max) , 
     Divsion_DIVISION_ID VARCHAR (36) NOT NULL , 
     Business_Unit_ID1 NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION 
    )
GO 

EXEC sp_addextendedproperty 'MS_Description' , 'The short description of the Business Unit.

One of:

HPS 
LABU
OAX 
SDX 
SPP 
TRD 
CMP 
DPT 
ERX 
PHL 
MSO 
RCF 
RCS 
RTS 
Bras
CEK 
KSA 
KGA 
KEA 
KKA 
NTP 
NTM 
PTP 
ECL 
ECS 
OPX 
DDL 
DDS 
MKO 
CUR ' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Business_Unit' , 'COLUMN' , 'Shortcode' 
GO

EXEC sp_addextendedproperty 'MS_Description' , 'Business Busines Unit Name:

One of:
Patient Services
Launch
Open Access
Specialty Distribution
Specialty Pharmacy
Trade
Compendia
Drug Pricing Transparency
ePrescribing
Pharma License
Managed Services
Commercial Finance
Consulting Services
Technology Services
Promo Ad Agency
CEEK
Key Safeguard Accounts
Key Growth Accounts
Key Emerging Accounts
KK Client Accounts - Proscribe Japan
PR Client Team
Medical Client Team
Pennside Client Team
Core Licenses
Core Services
Services
doDOC Licenses
doDOC Services
MKO
Curo' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Business_Unit' , 'COLUMN' , 'Name' 
GO

ALTER TABLE warehouse.Business_Unit ADD CONSTRAINT Business_Unit_PK PRIMARY KEY CLUSTERED (Business_Unit_ID1)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Client_Finance_Lead 
    (
     PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Person_PARTY_ID VARCHAR (36) , 
     External_Reference VARCHAR (max) 
    )
GO 
ALTER TABLE warehouse.Client_Finance_Lead 
    ADD CONSTRAINT FKArc_3 CHECK ( 
        (  (Person_PARTY_ID IS NOT NULL) AND 
         (Person_PARTY_ID IS NULL) ) OR 
        (  (Person_PARTY_ID IS NOT NULL) AND 
         (Person_PARTY_ID IS NULL) )  ) 
;

ALTER TABLE warehouse.Client_Finance_Lead ADD CONSTRAINT Client_Finance_Lead_PK PRIMARY KEY CLUSTERED (PARTY_ROLE_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

-- 

CREATE TABLE warehouse.Client_Services_Lead 
    (
     PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Person_PARTY_ID VARCHAR (36) , 
     External_Reference VARCHAR (max) 
    )
GO 
ALTER TABLE warehouse.Client_Services_Lead 
    ADD CONSTRAINT FKArc_2 CHECK ( 
        (  (Person_PARTY_ID IS NOT NULL) AND 
         (Person_PARTY_ID IS NULL) ) OR 
        (  (Person_PARTY_ID IS NOT NULL) AND 
         (Person_PARTY_ID IS NULL) )  ) 
;

ALTER TABLE warehouse.Client_Services_Lead ADD CONSTRAINT Client_Services_Lead_PK PRIMARY KEY CLUSTERED (PARTY_ROLE_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Cost_Budget 
    (
     BUDGET_ID VARCHAR (36) NOT NULL , 
     Business_Unit_Business_Unit_ID1 NUMERIC (28) NOT NULL , 
     Budget_Status_BUDGET_STATUS_ID VARCHAR (36) NOT NULL 
    )
GO

ALTER TABLE warehouse.Cost_Budget ADD CONSTRAINT Cost_Budget_PK PRIMARY KEY CLUSTERED (BUDGET_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Customer 
    (
     PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Person_PARTY_ID VARCHAR (36) , 
     External_Reference VARCHAR (max) , 
     Customer_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Project_PROJECT_ID VARCHAR (36) , 
     Opportunity_Opportunity_ID NUMERIC (28) NOT NULL 
    )
GO 
ALTER TABLE warehouse.Customer 
    ADD CONSTRAINT FKArc_1 CHECK ( 
        (  (Person_PARTY_ID IS NOT NULL) AND 
         (Person_PARTY_ID IS NULL) ) OR 
        (  (Person_PARTY_ID IS NOT NULL) AND 
         (Person_PARTY_ID IS NULL) )  ) 
;

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Customer__IDX ON warehouse.Customer 
    ( 
     Opportunity_Opportunity_ID 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Customer__IDXv1 ON warehouse.Customer 
    ( 
     Project_PROJECT_ID 
    ) 
GO

ALTER TABLE warehouse.Customer ADD CONSTRAINT Customer_PK PRIMARY KEY CLUSTERED (PARTY_ROLE_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Divsion 
    (
     DIVISION_ID VARCHAR (36) NOT NULL , 
     Shortcode VARCHAR (4) NOT NULL , 
     Name VARCHAR (max) , 
     Pillar_PILLAR_ID VARCHAR (36) NOT NULL 
    )
GO 

--

EXEC sp_addextendedproperty 'MS_Description' , 'The short description of the Division.

One of:

CMBU
RGBU
RPBU
SCBU
TLBC
ESBU
NTBU
MIBU
ECBU
OEBU
DDBU
MMBU
CRBU' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Divsion' , 'COLUMN' , 'Shortcode' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'The name of the division.

One of:
Commercialization
Regulatory
Riparian
Strategic Consulting
TL Biopharma Communications
ESS Classic
90Ten
Market Intelligence
ETS Core
Operational Excellence
doDOC
Market Access
Curo' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Divsion' , 'COLUMN' , 'Name' 
GO

-- 

ALTER TABLE warehouse.Divsion ADD CONSTRAINT Divsion_PK PRIMARY KEY CLUSTERED (DIVISION_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Drug 
    (
     PRODUCT_ID VARCHAR (36) NOT NULL , 
     Product_Name VARCHAR (max) NOT NULL , 
     Client_Product_Name VARCHAR (max) , 
     Customer_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) , 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID NUMERIC (28) 
    )
GO 
ALTER TABLE warehouse.Drug 
    ADD CONSTRAINT FKArc_6 CHECK ( 
        (  (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NOT NULL) AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL) )  ) 
;

ALTER TABLE warehouse.Drug ADD CONSTRAINT Drug_PK PRIMARY KEY CLUSTERED (PRODUCT_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.ISO_3166_Country_Codes 
    (
     "Alpha-2_Code" VARCHAR (2) NOT NULL , 
     "Alpha-3_Code" VARCHAR (2) , 
     Numeric_Code NUMERIC (28) , 
     Country_Name VARCHAR (max) , 
     Legal_Entity_PARTY_ID VARCHAR (36) NOT NULL 
    )
GO

ALTER TABLE warehouse.ISO_3166_Country_Codes ADD CONSTRAINT ISO_3166_Country_Codes_PK PRIMARY KEY CLUSTERED ("Alpha-2_Code")
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.ISO_4217_Currency_Code 
    (
     ISO_CURRENCY_CODE VARCHAR (3) NOT NULL , 
     Currency VARCHAR (max) 
    )
GO

ALTER TABLE warehouse.ISO_4217_Currency_Code ADD CONSTRAINT ISO_4217_Currency_Code_PK PRIMARY KEY CLUSTERED (ISO_CURRENCY_CODE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Legal_Entity 
    (
     PARTY_ID VARCHAR (36) NOT NULL , 
     Address_ADDRESS_ID VARCHAR (36) NOT NULL , 
     Name VARCHAR (max) NOT NULL , 
     External_Reference VARCHAR (8000) , 
     DUNS NUMERIC (9) 
    )
GO

ALTER TABLE warehouse.Legal_Entity ADD CONSTRAINT Legal_Entity_PK PRIMARY KEY CLUSTERED (PARTY_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Opportunity 
    (
     Customer_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Potential_Revenue MONEY , 
     State VARCHAR (max) , 
     Opportunity_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION 
    )
GO 


ALTER TABLE warehouse.Opportunity 
    ADD 
    CHECK ( State IN ('Lost', 'Sold') ) 
GO

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Opportunity__IDX ON warehouse.Opportunity 
    ( 
     Customer_PARTY_ROLE_ID 
    ) 
GO

ALTER TABLE warehouse.Opportunity ADD CONSTRAINT Opportunity_PK PRIMARY KEY CLUSTERED (Opportunity_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Person 
    (
     PARTY_ID VARCHAR (36) NOT NULL , 
     Address_ADDRESS_ID VARCHAR (36) NOT NULL , 
     Name VARCHAR (max) NOT NULL , 
     External_Reference VARCHAR (8000) 
    )
GO

ALTER TABLE warehouse.Person ADD CONSTRAINT Person_PK PRIMARY KEY CLUSTERED (PARTY_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Phase_Project_Line_Item 
    (
     Phase_Project_Line_Item_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Project_PROJECT_ID VARCHAR (36) NOT NULL , 
     Revenue MONEY , 
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) NOT NULL , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) 
    )
GO

ALTER TABLE warehouse.Phase_Project_Line_Item ADD CONSTRAINT Phase_Project_Line_Item_PK PRIMARY KEY CLUSTERED (Phase_Project_Line_Item_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Pillar 
    (
     PILLAR_ID VARCHAR (36) NOT NULL , 
     Shortcode VARCHAR (max) NOT NULL , 
     Name VARCHAR (max) 
    )
GO 


ALTER TABLE warehouse.Pillar 
    ADD 
    CHECK ( Shortcode IN ('ESS', 'ETS', 'Two Labs', 'Value & Access') ) 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'The PIllar Name, one of Two Labs, ESS, ETS or Value & Access' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Pillar' , 'COLUMN' , 'Shortcode' 
GO

ALTER TABLE warehouse.Pillar ADD CONSTRAINT Pillar_PK PRIMARY KEY CLUSTERED (PILLAR_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Project 
    (
     PROJECT_ID VARCHAR (36) NOT NULL , 
     Code VARCHAR (max) NOT NULL , 
     Customer_PARTY_ROLE_ID2 VARCHAR (36) , 
     Client_Services_Lead_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Client_Finance_Lead_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     ISO_4217_Currency_Code_ISO_CURRENCY_CODE VARCHAR (3) NOT NULL , 
     Customer_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     External_Reference VARCHAR (max) , 
     Statement_of_Work_Statement_of_Work_ID NUMERIC (28) NOT NULL , 
     Subsidiary_Subsidiary_ID NUMERIC (28) NOT NULL , 
     Opportunity_Opportunity_ID NUMERIC (28) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'The Customer that initisated the project. ' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Project' , 'COLUMN' , 'Customer_PARTY_ROLE_ID2' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'The Customer, a Subsidiary, or related company to the  OPPERTUNITY_CUSTOMER_PARTY_ROLE_ID, that is used for Project Delivery and Billing.' , 'SCHEMA' , 'warehouse' , 'TABLE' , 'Project' , 'COLUMN' , 'Customer_PARTY_ROLE_ID' 
GO

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Project__IDX ON warehouse.Project 
    ( 
     Statement_of_Work_Statement_of_Work_ID 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Project__IDXv1 ON warehouse.Project 
    ( 
     Customer_PARTY_ROLE_ID2 
    ) 
GO

ALTER TABLE warehouse.Project ADD CONSTRAINT Project_PK PRIMARY KEY CLUSTERED (PROJECT_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Project_Forecast 
    (
     Project_PROJECT_ID VARCHAR (36) NOT NULL , 
     Project_Forecast_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Statement_of_Work_Statement_of_Work_ID NUMERIC (28) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Project_Forecast__IDX ON warehouse.Project_Forecast 
    ( 
     Statement_of_Work_Statement_of_Work_ID 
    ) 
GO

ALTER TABLE warehouse.Project_Forecast ADD CONSTRAINT Project_Forecast_PK PRIMARY KEY CLUSTERED (Project_Forecast_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Resource 
    (
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) , 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID NUMERIC (28) 
    )
GO 
ALTER TABLE warehouse.Resource 
    ADD CONSTRAINT FKArc_7 CHECK ( 
        (  (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NOT NULL) AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL) )  ) 
;

CREATE TABLE warehouse.Resource_Project_Line_Item 
    (
     Resource_Project_Line_Item_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Project_PROJECT_ID VARCHAR (36) NOT NULL , 
     Revenue MONEY , 
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) NOT NULL , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE warehouse.Resource_Project_Line_Item ADD CONSTRAINT Resource_Project_Line_Item_PK PRIMARY KEY CLUSTERED (Resource_Project_Line_Item_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Revenue_Budget 
    (
     BUDGET_ID VARCHAR (36) NOT NULL , 
     Business_Unit_Business_Unit_ID1 NUMERIC (28) NOT NULL , 
     Budget_Status_BUDGET_STATUS_ID VARCHAR (36) NOT NULL 
    )
GO

ALTER TABLE warehouse.Revenue_Budget ADD CONSTRAINT Revenue_Budget_PK PRIMARY KEY CLUSTERED (BUDGET_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Reveue_Recongition_Schedule 
    (
     Statement_of_Work_Statement_of_Work_ID NUMERIC (28) NOT NULL 
    )
GO

CREATE TABLE warehouse.SaaS 
    (
     PRODUCT_ID VARCHAR (36) NOT NULL , 
     Product_Name VARCHAR (max) NOT NULL , 
     Client_Product_Name VARCHAR (max) , 
     Customer_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) , 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID NUMERIC (28) 
    )
GO 
ALTER TABLE warehouse.SaaS 
    ADD CONSTRAINT FKArc_5 CHECK ( 
        (  (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NOT NULL) AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL) )  ) 
;

ALTER TABLE warehouse.SaaS ADD CONSTRAINT SaaS_PK PRIMARY KEY CLUSTERED (PRODUCT_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Service 
    (
     SERVICE_ID VARCHAR (36) NOT NULL , 
     Short_Code VARCHAR (max) , 
     Name VARCHAR (max) NOT NULL 
    )
GO

ALTER TABLE warehouse.Service ADD CONSTRAINT Service_PK PRIMARY KEY CLUSTERED (SERVICE_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Statement_of_Work 
    (
     Customer_PARTY_ROLE_ID VARCHAR (36) NOT NULL , 
     Statement_of_Work_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Opportunity_Opportunity_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE warehouse.Statement_of_Work ADD CONSTRAINT Statement_of_Work_PK PRIMARY KEY CLUSTERED (Statement_of_Work_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Subsidiary 
    (
     Legal_Entity_PARTY_ID VARCHAR (36) NOT NULL , 
     Subsidiary_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Business_Unit_Business_Unit_ID1 NUMERIC (28) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Subsidiary__IDX ON warehouse.Subsidiary 
    ( 
     Legal_Entity_PARTY_ID 
    ) 
GO

ALTER TABLE warehouse.Subsidiary ADD CONSTRAINT Subsidiary_PK PRIMARY KEY CLUSTERED (Subsidiary_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Task_Project_Line_Item 
    (
     Task_Project_Line_Item_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     Project_PROJECT_ID VARCHAR (36) NOT NULL , 
     Revenue MONEY , 
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE warehouse.Task_Project_Line_Item ADD CONSTRAINT Task_Project_Line_Item_PK PRIMARY KEY CLUSTERED (Task_Project_Line_Item_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE warehouse.Therapeutic_Area 
    (
     Task_Project_Line_Item_Task_Project_Line_Item_ID NUMERIC (28) , 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID NUMERIC (28) , 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID NUMERIC (28) 
    )
GO 
ALTER TABLE warehouse.Therapeutic_Area 
    ADD CONSTRAINT FKArc_4 CHECK ( 
        (  (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NOT NULL) AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NULL) ) OR 
        (  (Resource_Project_Line_Item_Resource_Project_Line_Item_ID IS NOT NULL) AND 
         (Task_Project_Line_Item_Task_Project_Line_Item_ID IS NULL)  AND 
         (Phase_Project_Line_Item_Phase_Project_Line_Item_ID IS NULL) )  ) 
;

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Therapeutic_Area__IDX ON warehouse.Therapeutic_Area 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Therapeutic_Area__IDXv1 ON warehouse.Therapeutic_Area 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Therapeutic_Area__IDXv2 ON warehouse.Therapeutic_Area 
    ( 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID 
    ) 
GO

ALTER TABLE warehouse.Billing_Schedule 
    ADD CONSTRAINT Billing_Schedule_Project_Forecast_FK FOREIGN KEY 
    ( 
     Project_Forecast_Project_Forecast_ID
    ) 
    REFERENCES warehouse.Project_Forecast 
    ( 
     Project_Forecast_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Billing_Schedule 
    ADD CONSTRAINT Billing_Schedule_Statement_of_Work_FK FOREIGN KEY 
    ( 
     Statement_of_Work_Statement_of_Work_ID
    ) 
    REFERENCES warehouse.Statement_of_Work 
    ( 
     Statement_of_Work_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Business_Unit 
    ADD CONSTRAINT Business_Unit_Divsion_FK FOREIGN KEY 
    ( 
     Divsion_DIVISION_ID
    ) 
    REFERENCES warehouse.Divsion 
    ( 
     DIVISION_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Client_Finance_Lead 
    ADD CONSTRAINT Client_Finance_Lead_Legal_Entity_FK FOREIGN KEY 
    ( 
     Person_PARTY_ID
    ) 
    REFERENCES warehouse.Legal_Entity 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Client_Finance_Lead 
    ADD CONSTRAINT Client_Finance_Lead_Person_FK FOREIGN KEY 
    ( 
     Person_PARTY_ID
    ) 
    REFERENCES warehouse.Person 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Client_Services_Lead 
    ADD CONSTRAINT Client_Services_Lead_Legal_Entity_FK FOREIGN KEY 
    ( 
     Person_PARTY_ID
    ) 
    REFERENCES warehouse.Legal_Entity 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Client_Services_Lead 
    ADD CONSTRAINT Client_Services_Lead_Person_FK FOREIGN KEY 
    ( 
     Person_PARTY_ID
    ) 
    REFERENCES warehouse.Person 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Cost_Budget 
    ADD CONSTRAINT Cost_Budget_Budget_Status_FK FOREIGN KEY 
    ( 
     Budget_Status_BUDGET_STATUS_ID
    ) 
    REFERENCES warehouse.Budget_Status 
    ( 
     BUDGET_STATUS_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Cost_Budget 
    ADD CONSTRAINT Cost_Budget_Business_Unit_FK FOREIGN KEY 
    ( 
     Business_Unit_Business_Unit_ID1
    ) 
    REFERENCES warehouse.Business_Unit 
    ( 
     Business_Unit_ID1 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Customer 
    ADD CONSTRAINT Customer_Customer_FK FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Customer 
    ADD CONSTRAINT Customer_Legal_Entity_FK FOREIGN KEY 
    ( 
     Person_PARTY_ID
    ) 
    REFERENCES warehouse.Legal_Entity 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Customer 
    ADD CONSTRAINT Customer_Opportunity_FK FOREIGN KEY 
    ( 
     Opportunity_Opportunity_ID
    ) 
    REFERENCES warehouse.Opportunity 
    ( 
     Opportunity_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Customer 
    ADD CONSTRAINT Customer_Person_FK FOREIGN KEY 
    ( 
     Person_PARTY_ID
    ) 
    REFERENCES warehouse.Person 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Customer 
    ADD CONSTRAINT Customer_Project_FK FOREIGN KEY 
    ( 
     Project_PROJECT_ID
    ) 
    REFERENCES warehouse.Project 
    ( 
     PROJECT_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Divsion 
    ADD CONSTRAINT Divsion_Pillar_FK FOREIGN KEY 
    ( 
     Pillar_PILLAR_ID
    ) 
    REFERENCES warehouse.Pillar 
    ( 
     PILLAR_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Drug 
    ADD CONSTRAINT Drug_Customer_FK FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Drug 
    ADD CONSTRAINT Drug_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Drug 
    ADD CONSTRAINT Drug_Resource_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Resource_Project_Line_Item 
    ( 
     Resource_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Drug 
    ADD CONSTRAINT Drug_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.ISO_3166_Country_Codes 
    ADD CONSTRAINT ISO_3166_Country_Codes_Legal_Entity_FK FOREIGN KEY 
    ( 
     Legal_Entity_PARTY_ID
    ) 
    REFERENCES warehouse.Legal_Entity 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Legal_Entity 
    ADD CONSTRAINT Legal_Entity_Address_FK FOREIGN KEY 
    ( 
     Address_ADDRESS_ID
    ) 
    REFERENCES warehouse.Address 
    ( 
     ADDRESS_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Opportunity 
    ADD CONSTRAINT Opportunity_Customer_FK FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Person 
    ADD CONSTRAINT Person_Address_FK FOREIGN KEY 
    ( 
     Address_ADDRESS_ID
    ) 
    REFERENCES warehouse.Address 
    ( 
     ADDRESS_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Phase_Project_Line_Item 
    ADD CONSTRAINT Phase_Project_Line_Item_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Phase_Project_Line_Item 
    ADD CONSTRAINT Phase_Project_Line_Item_Project_FK FOREIGN KEY 
    ( 
     Project_PROJECT_ID
    ) 
    REFERENCES warehouse.Project 
    ( 
     PROJECT_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Phase_Project_Line_Item 
    ADD CONSTRAINT Phase_Project_Line_Item_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Client_Finance_Lead_FK FOREIGN KEY 
    ( 
     Client_Finance_Lead_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Client_Finance_Lead 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Client_Services_Lead_FK FOREIGN KEY 
    ( 
     Client_Services_Lead_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Client_Services_Lead 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Customer_FK FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Customer_FKv2 FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID2
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project_Forecast 
    ADD CONSTRAINT Project_Forecast_Project_FK FOREIGN KEY 
    ( 
     Project_PROJECT_ID
    ) 
    REFERENCES warehouse.Project 
    ( 
     PROJECT_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project_Forecast 
    ADD CONSTRAINT Project_Forecast_Statement_of_Work_FK FOREIGN KEY 
    ( 
     Statement_of_Work_Statement_of_Work_ID
    ) 
    REFERENCES warehouse.Statement_of_Work 
    ( 
     Statement_of_Work_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_ISO_4217_Currency_Code_FK FOREIGN KEY 
    ( 
     ISO_4217_Currency_Code_ISO_CURRENCY_CODE
    ) 
    REFERENCES warehouse.ISO_4217_Currency_Code 
    ( 
     ISO_CURRENCY_CODE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Opportunity_FK FOREIGN KEY 
    ( 
     Opportunity_Opportunity_ID
    ) 
    REFERENCES warehouse.Opportunity 
    ( 
     Opportunity_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Statement_of_Work_FK FOREIGN KEY 
    ( 
     Statement_of_Work_Statement_of_Work_ID
    ) 
    REFERENCES warehouse.Statement_of_Work 
    ( 
     Statement_of_Work_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Project 
    ADD CONSTRAINT Project_Subsidiary_FK FOREIGN KEY 
    ( 
     Subsidiary_Subsidiary_ID
    ) 
    REFERENCES warehouse.Subsidiary 
    ( 
     Subsidiary_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Resource 
    ADD CONSTRAINT Resource_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Resource_Project_Line_Item 
    ADD CONSTRAINT Resource_Project_Line_Item_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Resource_Project_Line_Item 
    ADD CONSTRAINT Resource_Project_Line_Item_Project_FK FOREIGN KEY 
    ( 
     Project_PROJECT_ID
    ) 
    REFERENCES warehouse.Project 
    ( 
     PROJECT_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Resource_Project_Line_Item 
    ADD CONSTRAINT Resource_Project_Line_Item_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Resource 
    ADD CONSTRAINT Resource_Resource_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Resource_Project_Line_Item 
    ( 
     Resource_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Resource 
    ADD CONSTRAINT Resource_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Revenue_Budget 
    ADD CONSTRAINT Revenue_Budget_Budget_Status_FK FOREIGN KEY 
    ( 
     Budget_Status_BUDGET_STATUS_ID
    ) 
    REFERENCES warehouse.Budget_Status 
    ( 
     BUDGET_STATUS_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Revenue_Budget 
    ADD CONSTRAINT Revenue_Budget_Business_Unit_FK FOREIGN KEY 
    ( 
     Business_Unit_Business_Unit_ID1
    ) 
    REFERENCES warehouse.Business_Unit 
    ( 
     Business_Unit_ID1 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Reveue_Recongition_Schedule 
    ADD CONSTRAINT Reveue_Recongition_Schedule_Statement_of_Work_FK FOREIGN KEY 
    ( 
     Statement_of_Work_Statement_of_Work_ID
    ) 
    REFERENCES warehouse.Statement_of_Work 
    ( 
     Statement_of_Work_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.SaaS 
    ADD CONSTRAINT SaaS_Customer_FK FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.SaaS 
    ADD CONSTRAINT SaaS_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.SaaS 
    ADD CONSTRAINT SaaS_Resource_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Resource_Project_Line_Item 
    ( 
     Resource_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.SaaS 
    ADD CONSTRAINT SaaS_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Statement_of_Work 
    ADD CONSTRAINT Statement_of_Work_Customer_FK FOREIGN KEY 
    ( 
     Customer_PARTY_ROLE_ID
    ) 
    REFERENCES warehouse.Customer 
    ( 
     PARTY_ROLE_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Statement_of_Work 
    ADD CONSTRAINT Statement_of_Work_Opportunity_FK FOREIGN KEY 
    ( 
     Opportunity_Opportunity_ID
    ) 
    REFERENCES warehouse.Opportunity 
    ( 
     Opportunity_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Subsidiary 
    ADD CONSTRAINT Subsidiary_Business_Unit_FK FOREIGN KEY 
    ( 
     Business_Unit_Business_Unit_ID1
    ) 
    REFERENCES warehouse.Business_Unit 
    ( 
     Business_Unit_ID1 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Subsidiary 
    ADD CONSTRAINT Subsidiary_Legal_Entity_FK FOREIGN KEY 
    ( 
     Legal_Entity_PARTY_ID
    ) 
    REFERENCES warehouse.Legal_Entity 
    ( 
     PARTY_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Task_Project_Line_Item 
    ADD CONSTRAINT Task_Project_Line_Item_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Task_Project_Line_Item 
    ADD CONSTRAINT Task_Project_Line_Item_Project_FK FOREIGN KEY 
    ( 
     Project_PROJECT_ID
    ) 
    REFERENCES warehouse.Project 
    ( 
     PROJECT_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Task_Project_Line_Item 
    ADD CONSTRAINT Task_Project_Line_Item_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Therapeutic_Area 
    ADD CONSTRAINT Therapeutic_Area_Phase_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Phase_Project_Line_Item_Phase_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Phase_Project_Line_Item 
    ( 
     Phase_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Therapeutic_Area 
    ADD CONSTRAINT Therapeutic_Area_Resource_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Resource_Project_Line_Item_Resource_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Resource_Project_Line_Item 
    ( 
     Resource_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE warehouse.Therapeutic_Area 
    ADD CONSTRAINT Therapeutic_Area_Task_Project_Line_Item_FK FOREIGN KEY 
    ( 
     Task_Project_Line_Item_Task_Project_Line_Item_ID
    ) 
    REFERENCES warehouse.Task_Project_Line_Item 
    ( 
     Task_Project_Line_Item_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            29
-- CREATE INDEX                            10
-- ALTER TABLE                             93
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0



