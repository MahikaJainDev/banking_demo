const getHomeData = """
query getHome {
          home {
          name
          accountNumber
          balance
          currency
          address {
          streetName
          buildingNumber
          townName
          postCode
          country
          }
          recentTransactions {
          date
          description
          amount
          fromAccount
          toAccount
          }
          upcomingBills {
          date
          description
          amount
          fromAccount
          toAccount
          }
          }
      }""";

const getAccounts = """
query getAccounts {
  accounts {
    id
    accountNumber
    accountType
    balance
    accountHolder
    }
}
""";

const getTransactions = """
query getTransactions {
   transactions {
     date
     description
     amount
     fromAccount
     toAccount
     }
}
""";

const getContacts = """
query getContacts {
  contacts
  }
""";

const getStatements = """
query getStatements {
  statements {
  date
  description
  amount
    }
}

""";