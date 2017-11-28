module.exports = {
  "extends": "airbnb-base",
  "rules": {
    "semi": ["error", "always"],
    "quotes": ["error", "single", { "allowTemplateLiterals": true }],
    "prefer-destructuring": ["error", {
      "array": false,
      "object": false
    }],
  },
  "globals": {
    "describe": true,
    "it": true,
    "assert": true,
    "equal": true,
    "$": true,
    "document": true,
  }
};
