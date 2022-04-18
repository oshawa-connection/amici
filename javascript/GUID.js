export class GUID {
    /**
     * @private
     * @readonly
     * @constant 
     */
    isGUIDRegex = /^([0-9A-Fa-f]{8}[-][0-9A-Fa-f]{4}[-][0-9A-Fa-f]{4}[-][0-9A-Fa-f]{4}[-][0-9A-Fa-f]{12})$/;

    /**
     * @private 
     * @readonly
     * @type {string}
     */
    value = "00000000-0000-0000-0000-000000000000"
    /**
     * 
     * @param {string | undefined} value 
     */
    constructor(value) {
        if (value === undefined) {
            return;
        }
        if(this.isGUIDRegex.test(value) === false) {
            throw new Error(`${value} was not a valid GUID`);
        }
        this.value = value;
    }

    toString() {
        return this.value;
    }
}