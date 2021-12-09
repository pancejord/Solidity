const { assert } = require("console");

var fileartifact = artifacts.require("./file.sol");

contract ("filecontract", function(accounts) {
    it('This is my TestCase', function() {
        return fileartifact.deployed().then(function(instance) {
            console.log(instance);
        })
    })
});

it('should not have an Entry for a test-Hash', async function() {
    return fileartifact.deployed().then(async function(instance) {
        try {
            await instance.viewSet(0x454349E422F05297191EAD13E21D3DB520E5ABEF52055E4964B82FB213F593A1);
        } catch (error) {
            if(error.message.search("revert") >-0) {
                assert.equal(error.message,search("revert")>-0, true, "Error msg does not reflect exception msg.");
             } else {
            throw error;
             }
        }
    });
});
