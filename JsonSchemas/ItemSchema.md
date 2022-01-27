From modpage

<details>
<summary> JSON Schema </summary>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "Form": {
      "type": "string",
      "description": "Solid, Liquid, Gas or Heat"
    },
    "Name": {
      "type": "string",
      "description": "ItemName"
    },
    "NameShort": {
      "type": "string",
      "description": "ItemName Shortend"
    },
    "Description": {
      "type": "string",
      "description": "Item Description"
    },
    "ItemCategory": {
      "type": "string",
      "description": "ItemCategory Class Name, 'Cat_' & '_C' are optional"
    },
    "VisualKit": {
      "type": "string",
      "description": "VisualKits describe how Items look. VisualKits are defined by ItemDescriptors and can be used by their ClassNames or added via 'Config/ItemVisualKits' Path via their FileNames"
    },
    "EnergyValue": {
      "type": "number",
      "description": "EnergyValue in MJ",
      "minimum": 0.0
    },
    "RadioactiveDecay": {
      "type": "number",
      "minimum": 0.0
    },
    "CanBeDiscarded": {
      "type": "boolean",
      "description": "ItemClass default is true"
    },
    "RememberPickUp": {
      "type": "boolean",
      "description": "this is used in combination with Schematic Unlocks, default is false"
    },
    "ResourceSinkPoints": {
      "type": "integer",
      "minimum": 0.0
    },
    "ResourceItem": {
      "type": "object",
      "description": "only for FGResourceDescriptors",
      "properties": {
          "PingColor": {
            "type": "object",
            "properties": {
              "r": {
                "type": "number"
              },
              "g": {
                "type": "number"
              },
              "b": {
                "type": "number"
              },
              "a": {
                "type": "number"
              }
            },
            "Description": "RGB float here"
          },
          "CollectSpeedMultiplier": {
            "description": "CollectSpeedMultiplier of Items",
            "type": "integer"
          }
      }
    },
    "FuelWasteItem":{
      "type":"object",
      "description": "only for FGNuclearFuelDescriptor",
      "properties":{
        "SpentFuelClass": {
          "description": "ClassName of the Spent version",
          "type": "string"
        },
        "AmountOfWaste": {
          "description": "Waste Amount of Items",
          "type": "integer",
          "minimum": 0
        }
      }
    }
  }
}
```

</details>