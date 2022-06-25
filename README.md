# multi-165

Call supportsInterface on multiple contracts at once to reduce the number of query to do on a node.

Existing multicall implementation uses all gas and calling old contract this way consume all gas blocking further call in the list
