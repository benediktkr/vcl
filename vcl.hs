import Data.Maybe
import Data.List

-- Non-terminals

-- ACL ::= 'acl' identifier '{' {ACLENTRY} '}'
data Acl = Acl Identifier [AclEntry]
printAcl (Acl identifier entries) = "acl " ++ printIdentifier identifier ++ " {\n    " ++ (intercalate "\n    " (map printAclEntry entries)) ++ "\n}"

-- ACLENTRY ::= ['!'] iprange ';' | '(' ['!'] iprange ')' ';' |  ['!'] '(' iprange ')' ';'
data AclEntry = AclEntry IPRange (Maybe Bool)
printAclEntry :: AclEntry -> String
printAclEntry (AclEntry iprange Nothing)      = printIPRange iprange  ++ ";"
printAclEntry (AclEntry iprange (Just True))  = printIPRange iprange ++ ";"
printAclEntry (AclEntry iprange (Just False)) = "! " ++ printIPRange iprange ++ ";"

---- Terminals
-- For now I'm using strings to define terminals, but should be more precise 

-- iprange ::= string [ '/' number ]
data IPRange = IPRange String (Maybe Integer)
printIPRange :: IPRange -> String
printIPRange (IPRange iprange Nothing)     = iprange
printIPRange (IPRange iprange (Just cidr)) = iprange ++ "/" ++ show cidr

-- identifier ::= [a-zA-Z][a-zA-Z0-9_-]*
data Identifier = Identifier String
printIdentifier :: Identifier -> String
printIdentifier (Identifier identifier) = identifier
