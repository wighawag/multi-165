const hre = require('hardhat');
async function main() {
  const {deployer} = await hre.getNamedAccounts('deployer')
  await hre.deployments.deploy('Multi165', {from: deployer, deterministicDeployment: true, log: true});
}
main.tags = ["Multi165"]
module.exports = main;