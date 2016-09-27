headphones Cookbook
===================
This cookbook will install and configure headphones.

Requirements
------------

Platforms:
* CentOS 7

Attributes
----------

Usage
-----
#### headphones::default

Just include `headphones` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[headphones]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
