From modpage

<details>
<summary> JSON Schema </summary>

```json

{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "Mesh": {
      "type": "string",
      "description": "Path of the Mesh Example : '/Game/FactoryGame/Resource/Parts/PackagedWater/SM_PackedWater_01.SM_PackedWater_01'"
    },
    "BigIcon": {
      "type": "string",
      "description": "Icon Path of the Big Icon Example '/Game/FactoryGame/Resource/RawResources/Water/UI/LiquidWater_Pipe_512.LiquidWater_Pipe_512'"
    },
  "SmallIcon": {
      "type": "string",
      "description": "Icon Path of the Small Icon Example: '/Game/FactoryGame/Resource/RawResources/Water/UI/LiquidWater_Pipe_256.LiquidWater_Pipe_256'"
    },
  
    "FluidColor": {
    "type": "object",
    "properties": {
      "r": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      },
      "g": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      },
      "b": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      },
      "a": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      }
    }
    },
  "GasColor": {
    "type": "object",
    "properties": {
      "r": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      },
      "g": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      },
      "b": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      },
      "a": {
        "type": "integer",
        "minimum": 0,
        "maximum": 255
      }
    }
    }
  }
}

```

</details>