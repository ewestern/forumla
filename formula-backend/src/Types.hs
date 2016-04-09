{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Types where
import qualified Data.Map as M
import qualified Data.Vector as V
import qualified Data.Text as T
import Data.Aeson
import Data.Aeson.TH

{-data Ref a = Ref { unRef :: !T.Text } deriving (Eq, Ord, Show, Read)-}
type Ref a = T.Text

options = defaultOptions { sumEncoding = ObjectWithSingleField }

data FieldType =
    FieldType_Text
  | FieldType_Int
  | FieldType_Float
  | FieldType_Enum (V.Vector T.Text)



data FieldValue =
    FieldValue_Text T.Text
  | FieldValue_Int Int
  | FieldValue_Float Float
  | FieldValue_Enum T.Text



data Field = Field {
    _fieldName :: T.Text
  , _fieldType :: FieldType
}
  



data Submission = Submission {
  _submissiondValues :: M.Map (Ref FieldValue) FieldValue
}

data Form = Form {
    _formName :: T.Text
  , _formFieldTypes :: M.Map (Ref Field) Field
}



forms :: [Form]
forms = 
  let
    fts = M.fromList 
          [ ("number-field", Field "Number Field" FieldType_Int)
          , ("text-field", Field "Text Field" FieldType_Text)
          , ("selection-field", Field "Selection Field" (FieldType_Enum $ V.fromList ["test"]))]
    f = Form "Test Form" fts
  in 
    [f] 


