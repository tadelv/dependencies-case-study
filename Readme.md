# Swift-Dependencies Case study

## Separating live implementation from test implementations
This case study demonstrates one possible way of structuring your dependencies using [swift-dependencies]. Separating implementations into modules, one module holds the test implementations (interface) while another holds the live implementation (definition).

The definition is then linked into the final executable, while still using the interface for previews.
Additionally, separate feature modules need only depend on the interface and not on the definition at all.

[swift-dependencies]: https://github.com/pointfreeco/swift-dependencies