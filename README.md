# vcl

This is a simple AST, Pretty Printer and Parser for VCL (the DSL for
configuring Varnish).

This is a learning project, with the goal of being able to correctly
generating ACLs in VCL. (I may or may not iplement the rest of this
grammar).

The source
[BNF can be found here](https://www.varnish-cache.org/trac/wiki/VCL.BNF).

I have submitted an improvement that hasn't been added yet, see
`VCL.BNF` in this repository.

```haskell
λ > let ip_a = IPRange "192.168.0.1" $ Just 24
λ > let ip_b = IPRange "10.40.20.1" Nothing
λ > let entries = [AclEntry ip_a True, AclEntry ip_b False]
λ > Acl (Identifier "testacl") entries
λ> Acl (Identifier "test") [AclEntry ip_a True, AclEntry ip_b False]
acl"test"{
  "192.168.0.1"/32;
  ! "10.40.20.1";
}
λ>
```

