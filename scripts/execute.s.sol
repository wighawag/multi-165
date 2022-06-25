// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Script.sol";
import "src/Multi165.sol";

import "forge-std/console2.sol";

contract Execute is Script{

    function run() external {
        Multi165 multi = new Multi165();
        IERC165[] memory addresses = new IERC165[](50);
        addresses[0] = IERC165(address(0x00dd16ec0f66e54d453e6756713e533355989040e4));
        addresses[1] = IERC165(address(0x002c949199cff14aeaf1b33d64db01f48fb57f592f));
        addresses[2] = IERC165(address(0x00f230b790e05390fc8295f4d3f60332c93bed42e2));
        addresses[3] = IERC165(address(0x0020f7a3ddf244dc9299975b4da1c39f8d5d75f05a));
        addresses[4] = IERC165(address(0x0002f61fd266da6e8b102d4121f5ce7b992640cf98));
        addresses[5] = IERC165(address(0x001f573d6fb3f13d689ff844b4ce37794d79a7ff1c));
        addresses[6] = IERC165(address(0x00c0829421c1d260bd3cb3e0f06cfe2d52db2ce315));
        addresses[7] = IERC165(address(0x006cfba3c7b4c944bdc9442c91d67d35d7c27fa430));
        addresses[8] = IERC165(address(0x0004ac42ce41f0f9831347bdf74fab03c828173e18));
        addresses[9] = IERC165(address(0x0006012c8cf97bead5deae237070f9587f8e7a266d));
        addresses[10] = IERC165(address(0x00c27a2f05fa577a83ba0fdb4c38443c0718356501));
        addresses[11] = IERC165(address(0x00b62132e35a6c13ee1ee0f84dc5d40bad8d815206));
        addresses[12] = IERC165(address(0x007ec33fc1b5c4847cc665236296ddb160474a2a87));
        addresses[13] = IERC165(address(0x003bcbd2093e991363b98cf0f51d40fecd94a55a0d));
        addresses[14] = IERC165(address(0x005eac95ad5b287cf44e058dcf694419333b796123));
        addresses[15] = IERC165(address(0x00bdda280ee7bccc68f3be60a369b6b1eaee02493c));
        addresses[16] = IERC165(address(0x0076aa308852156e38dd4e1ee385cafa1ff4ad85ae));
        addresses[17] = IERC165(address(0x003da6c7db68f17e72ce153e485e453922f46b1d4a));
        addresses[18] = IERC165(address(0x000af44e2784637218dd1d32a322d44e603a8f0c6a));
        addresses[19] = IERC165(address(0x00d4e26b4e8e9881e8905315aba189b694f2307757));
        addresses[20] = IERC165(address(0x0074fd51a98a4a1ecbef8cc43be801cce630e260bd));
        addresses[21] = IERC165(address(0x00351d5ea36941861d0c03fdfb24a8c2cb106e068b));
        addresses[22] = IERC165(address(0x008a0ba07b4358de33efecff2f09f55c85cda14670));
        addresses[23] = IERC165(address(0x00df6ef343350780bf8c3410bf062e0c015b1dd671));
        addresses[24] = IERC165(address(0x009c794f933b4dd8b49031a79b0f924d68bef43992));
        addresses[25] = IERC165(address(0x00f0ee6b27b759c9893ce4f094b49ad28fd15a23e4));
        addresses[26] = IERC165(address(0x00491c9a23db85623eed455a8efdd6aba9b911c5df));
        addresses[27] = IERC165(address(0x00d506e5e57e22c695bf28c96e73c296051177a678));
        addresses[28] = IERC165(address(0x002bf91c18cd4ae9c2f2858ef9fe518180f7b5096d));
        addresses[29] = IERC165(address(0x00cf6afbb480351a27950f96923094a0ce1559cc26));
        addresses[30] = IERC165(address(0x005f53f7a8075614b699baad0bc2c899f4bad8fbbf));
        addresses[31] = IERC165(address(0x00abbbb6447b68ffd6141da77c18c7b5876ed6c5ab));
        addresses[32] = IERC165(address(0x007c47318dd2d79976032951f535cb5a713bd53971));
        addresses[33] = IERC165(address(0x00054c64741dbafdc19784505494029823d89c3b13));
        addresses[34] = IERC165(address(0x00009e864923b49263c7f10d19b7f8ab7a9a5aad33));
        addresses[35] = IERC165(address(0x0033c623a2baafeb8d15dfaf3ce44095efec83d72c));
        addresses[36] = IERC165(address(0x00ba7435a4b4c747e0101780073eeda872a69bdcd4));
        addresses[37] = IERC165(address(0x001dea979ae76f26071870f824088da78979eb91c8));
        addresses[38] = IERC165(address(0x00a1dbcd487d2fe68354f13d9ccce65ea4f66f4d07));
        addresses[39] = IERC165(address(0x002d0e95bd4795d7ace0da3c0ff7b706a5970eb9d3));
        addresses[40] = IERC165(address(0x0057ad67acf9bf015e4820fbd66ea1a21bed8852ec));
        addresses[41] = IERC165(address(0x007a8f99fcaffb3d94f07ad30feade85e556205599));
        addresses[42] = IERC165(address(0x00d3f9d7f8b0a6dd663bc5dc1a2229ae845fb9e779));
        addresses[43] = IERC165(address(0x0091780bcd29620338d2d3bc16bc576d1055e85e38));
        addresses[44] = IERC165(address(0x00b8c77482e45f1f44de1745f52c74426c631bdd52));
        addresses[45] = IERC165(address(0x00f485c5e679238f9304d986bb2fc28fe3379200e5));
        addresses[46] = IERC165(address(0x00977b0584b50cdd64e2f8185b682a1f256448c7c8));
        addresses[47] = IERC165(address(0x00e41d2489571d322189246dafa5ebde1f4699f498));
        addresses[48] = IERC165(address(0x00946956f5bb7832aba7aa02ec722e4c558e12b2e1));
        addresses[49] = IERC165(address(0x00e5db5228245ac45f6ed463cbca7e5d48898d5ec3));
        bool[] memory result = multi.supportsInterface(addresses, 0x80ac58cd);
        for (uint256 i = 0;  i < result.length; i++) {
            console2.log(result[i]);
        }
    }   
}