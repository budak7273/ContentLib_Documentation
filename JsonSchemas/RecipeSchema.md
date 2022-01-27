From Modpage

<details>
<summary> JSON Schema </summary>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "Name": {
      "type": "string",
      "description": "Recipe Name. If not used first Product is used as Name"
    },
    "Ingredients": {
      "type": "array",
      "items": {
        "properties": {
          "Item": {
            "type": "string",
            "description": "Class Name -> 'Desc_Coal_C' while 'Desc_' & '_C' is not required"
          },
          "Amount": {
            "description": "Amount of Items",
            "type": "integer"
          }
        },
        "required": [ "Item", "Amount" ],
        "type": "object"
      },
      "minItems": 1
    },
    "Products": {
      "type": "array",
      "items": {
        "properties": {
          "Item": {
            "type": "string",
            "description": "Class Name -> 'Desc_Coal_C' while 'Desc_' & '_C' is not required"
          },
          "Amount": {
            "description": "Amount of Items",
            "type": "integer"
          }
        },
        "required": [ "Item", "Amount" ],
        "type": "object"
      },
      "minItems": 1
    },
    "ProducedIn": {
      "type": "array",
      "items": {
        "Item": {
          "type": "string",
          "description": "Class Name -> 'Build_ConstruktorMk1_C' while 'Build_' & '_C' is not required. Alternatively 'manual' can be used to Add this Recipe to all Manual Crafters"
        }
      },
      "minItems": 1
    },
    "UnlockedBy": {
      "type": "array",
      "Item": {
        "type": "string",
        "description": "Class Name -> 'Schematic_1-1_C' while '_C' is not required"
      },
      "minItems": 1
    },
    "ManufacturingDuration": {
      "type": "number",
      "description": "Duration for the Recipe Cycle in Seconds",
      "minimum": 0.0
    },
    "ManualManufacturingMultiplier": {
      "type": "number",
      "description": "Multiplier for the Recipe Cycle in Crafting Components",
      "minimum": 0.0
    },
    "VariablePowerConsumptionFactor": {
      "type": "number",
      "minimum": 0.0
    },
    "VariablePowerConsumptionConstant": {
      "type": "number",
      "minimum": 0.0
    },
    "ManufacturingMenuPriority": {
      "type": "number",
      "minimum": 0.0
    },
    "ClearIngredients": {
      "type": "boolean",
      "description": "Should the Recipe this is used on have its Ingredient Array Cleared before Adding to it? Default is true when Property Ingredients exists, false when not."
    },
    "ClearProducts": {
      "type": "boolean",
      "description": "Should the Recipe this is used on have its Products Array Cleared before Adding to it? Default is true when Property Products exists, false when not."

    },
    "ClearBuilders": {
      "type": "boolean",
      "description": "Should the Recipe this is used on have its Builders Array Cleared before Adding to it? Default is true when Property ProducedIn exists, false when not."
    }
  }
}
```

</details>
