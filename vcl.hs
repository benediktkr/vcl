{-# LANGUAGE InstanceSigs #-}

import Data.Maybe
import Data.List

-- Non-terminals

-- ACL ::= 'acl' identifier '{' {ACLENTRY} '}'
data Acl = Acl Identifier [AclEntry]
instance Show Acl where
    show :: Acl -> String
    show (Acl identifier entries) = "acl" ++ show identifier ++ "{\n" ++ (intercalate "\n    " (map show entries)) ++ "\n}"

-- ACLENTRY ::= ['!'] iprange ';' | '(' ['!'] iprange ')' ';' |  ['!'] '(' iprange ')' ';'
data AclEntry = AclEntry IPRange Bool
instance Show AclEntry where
    show :: AclEntry -> String
    show (AclEntry iprange True)  = show iprange ++ ";"
    show (AclEntry iprange False) = "! " ++ show iprange ++ ";"

---- Terminals
-- For now I'm using strings to define terminals, but should be more precise 

-- iprange ::= string [ '/' number ]
data IPRange = IPRange String (Maybe Integer)
instance Show IPRange where
    show :: IPRange -> String
    show (IPRange iprange Nothing)     = "\"" ++ show iprange ++ "\""
    show (IPRange iprange (Just cidr)) = "\"" ++ show iprange ++ "\"" ++ "/" ++ show cidr

-- identifier ::= [a-zA-Z][a-zA-Z0-9_-]*
data Identifier = Identifier String
instance Show Identifier where
   show :: Identifier -> String
   show (Identifier identifier) = show identifier
