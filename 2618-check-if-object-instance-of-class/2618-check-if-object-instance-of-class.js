/**
 * @param {*} obj
 * @param {*} classFunction
 * @return {boolean}
 */
var checkIfInstanceOf = function(obj, classFunction) {
    if (typeof classFunction !== 'function'){
        return false;
    }

    if (obj === null || obj === undefined){
        return false;
    }

    let currProto = Object.getPrototypeOf(obj);
    while (currProto !== null){
        if (currProto === classFunction.prototype){
            return true;
        }
        currProto = Object.getPrototypeOf(currProto);
    }
    return false;
};

/**
 * checkIfInstanceOf(new Date(), Date); // true
 */