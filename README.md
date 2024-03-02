# ATM-Management-Analysis
This script is designed to create and manage the Financial Services Commission database, which tracks information related to financial institutions, transactions, investigations, and auditors. It includes the creation of tables, views, stored procedures, functions, and demonstration transactions.

Tables:

FinancialInstitution: Stores information about financial institutions such as address, parish, name, main banker, branch number, and contact number.
CommercialBank: Records deposit and revenue data for commercial banks, with a foreign key reference to FinancialInstitution.
CreditUnion: Stores the number of shareholders for credit unions, referencing FinancialInstitution.
ATM: Manages ATM details including ATM code, name, address, type, and linked financial institution.
ATMTransaction: Tracks ATM transactions, including details like status, balance before and after, transaction type, date, amount, card number, CVV, and account number, with a reference to the ATM.
Investigation: Records details of ongoing investigations, including purpose, start date, and end date.
Auditor: Manages auditor information such as ID, name, salary, gender, phone, and address.
TransInvest: Links transactions with investigations and auditors.
Views:

ATM_Transaction_View: Provides an overview of ATM transactions and investigations per ATM.
FlaggedTransactionsReport: Displays flagged transactions along with investigation details and assigned auditors.
OngoingInvestigationsReport: Lists ongoing investigations with transaction and auditor information.
FinancialInstitutionOverview: Offers an overview of financial institutions including deposit, revenue, and shareholder data.
InvestigationsPerFinancialInstitution: Shows the number of investigations on financial institutions in the past year.
Stored Procedures:

SP_InsertATM: Inserts new ATM records into the database.
GetATMsByBank: Retrieves ATM records belonging to a specific bank.
SP_InsertInvestigation: Allows an auditor to start a new investigation and update transaction status.
SP_CloseInvestigation: Closes an ongoing investigation, updating end date and transaction status.
Functions:

CalculateTransactionMetrics: Calculates transaction metrics such as average transactions per ATM and percentage of successful and failed transactions.
Demo Transactions:
Demonstrative transactions are included to showcase the functionality of the database management system, including inserts, updates, and views.
