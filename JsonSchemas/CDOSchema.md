From Modpage

JSON Schema CDO Edit

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "Class": {
      "type": "string",
      "description": "Path Name."
    },
    "Edits": {
      "type": "array",
      "items": {
        "properties": {
          "Property": {
            "type": "string",
            "description": "Name of the Property to Edit ! case sensitive !"
          },
          "Value": {
            "tpye": "wildcard",
            "description": "Either Object or String or Number"
          }
        },
        "required": ["Property", "Value"],
        "type": "object"
      },
      "minItems": 0
    }
  }
}
```