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