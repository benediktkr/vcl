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
λ > let ip0 = AclEntry (IPRange "10.40.20.1" (Just 32)) (Just False)
λ > let ip1 = AclEntry (IPRange "130.208.251.0" (Just 24)) (Just True)
λ > let acl = Acl (Identifier "testacl") [ip0, ip1]
λ > putStrLn $ printAcl acl
acl testacl {
    ! "10.40.20.1"/32;
    "130.208.251.0"/24;
}
λ > 
```

