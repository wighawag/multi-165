require('hardhat-deploy');
const {addForkConfiguration, node_url, accounts} = require('./utils/network')

module.exports = {
    solidity: "0.8.15",

    networks: addForkConfiguration({
      localhost: {
        url: node_url('localhost'),
        accounts: accounts(),
      },
      mainnet: {
        url: node_url('mainnet'),
        accounts: accounts('mainnet'),
      },
      goerli: {
        url: node_url('goerli'),
        accounts: accounts('goerli'),
      },
    }),
    paths: {
        sources: './src'
    },
    namedAccounts: {
        deployer: 0,
    }
}