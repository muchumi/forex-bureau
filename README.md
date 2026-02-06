[![Codacy Badge](https://app.codacy.com/project/badge/Grade/365b3a35c02d4ef18820a3678a7f9902)](https://app.codacy.com/gh/muchumi/forex-bureau/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

# Forex Bureau

A Forex-Bureau AL project that converts currencies in accordance with current exchange rates.  
The primary use case is USD ↔ KES (US Dollar ↔ Kenyan Shilling) for logic and testing.

## Table of Contents

- [About](#about)  
- [Features](#features)  
- [Tech Stack](#tech-stack)  
- [Getting Started](#getting-started)  
- [Usage](#usage)  
- [Configuration](#configuration)  
- [Contributing](#contributing)  
- [License](#license)  
- [Contact](#contact)  

## About

Forex Bureau is designed to handle currency conversions for a bureau environment-style workflow.  
It provides modules for currency setup, transactions, audit trail, notifications and management of bureau roles.

While it supports generic currencies, the recommended pair for testing and demonstration is USD ↔ KES (US Dollar ↔ Kenyan Shilling) to align with system logic.  

## Features

- Ability to define currencies via the `ForexCurrency.al` module  
- Currency conversion transactions using `ForexTransaction.al` and related cards/lists  
- Daily reports and summaries (`ForexDailyReport.al`, `ForexTransactionSummary.al`)  
- Audit‐trail tracking for currency transactions (`ForexAuditTrail.*.al`)  
- Role/permission sets for bureau managers, cashiers, supervisors (`ForexManagerPermissionSet.al`, `ForexCashierPermissionSet.al`, etc.)  
- Notification management for rate changes or alerts (`ForexNotificationSetup.al`, `ForexNotificationManagement.al`)  
- Integration into Role Centre and cards for AL extension modules (e.g., `ForexCurrencyCard.al`, `ForexTransactionCard.al`)  
- Dockerfile included for containerised deployment (with AL/Business Central context)  

## Tech Stack

- **Language**: AL (Application Language) for Business Central extensions  
- **Containerization**: Docker (`Dockerfile` included)  
- **Platform**: Intended for Microsoft Dynamics 365 Business Central on-premise or cloud  

## Getting Started

### Prerequisites

- Microsoft Dynamics 365 Business Central (on premise or cloud sandbox)  
- AL environment (Visual Studio Code with AL Language extension)  
- Docker (optional, if you plan to use container deployment)  
- Basic familiarity with Business Central extension packaging and .app deployment  

### Installation Steps

1. Clone the repository:  
   ```bash
   git clone https://github.com/muchumi/forex-bureau.git
   cd forex-bureau
   
2. Open the project in VS Code.

3. Modify app.json if needed (publisher, version, dependencies).

4. Build the .app file using the AL compiler.

5. Publish and install the extension file (.app) into your Business Central sandbox or production environment.

## Example using PowerShell:
```powershell
Publish-NavApp -ServerInstance BC -Path .\bin\release\ForexBureau.app
Install-NavApp -ServerInstance BC -Name "BC260_ForexBureau"

6. Configure your currency pairs and set up the permissions, notifications, and other setup items in the system.

## Usage

Define currencies under the Currency list (navigate to the ForexCurrency list).

Create conversion transactions via the Transaction card (enter amount, select source currency, target currency, rate).

Generate reports (Daily Report, Transaction Summary) to view bureau operations.

Use role-based permissions: Assign the “Cashier”, “Supervisor”, and “Manager” permission sets accordingly.

Set up notifications: For example, when a rate changes beyond a threshold, send an alert to designated users.

## Configuration

ForexSetup.al / ForexSetupCard.al: Initial system setup for the bureau (e.g., default currency, rounding rules).

ForexNotificationSetup.al / ForexNotificationSetupCard.al: Notification thresholds and recipients.

ForexBureauManagerProfile.al, ForexBureauRoleCenter.al: Role centre and profile customisations for the bureau manager role.

You may modify permissions in *.PermissionSet.al files to suit your operational model.

## Contributing

Contributions are welcome! Hereis how you can help:

Fork this repository.

Create a feature branch (git checkout -b feature/YourFeature).

Commit your changes with clear messages.

Submit a Pull Request describing your changes.

Please ensure you follow any existing coding conventions and include tests for new features.

## License

This project is open-source. You can use, modify and distribute it per the terms specified in the LICENSE file (to be included).

## Contact

Created and maintained by Muchumi.
For questions or support, please open an issue in this repository.
