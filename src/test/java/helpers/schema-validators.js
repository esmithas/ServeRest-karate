function validateSchema(response, schema) {
    try {
        var schemaObj;
        if (typeof schema === 'string') {
            schemaObj = read(schema);
        } else {
            schemaObj = schema;
        }
        return karate.match(response, schemaObj).pass;
    } catch (e) {
        print('Error validando esquema: ' + e.message);
        return false;
    }
}
module.exports = { validateSchema };