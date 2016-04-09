{-# LANGUAGE GADTs, TypeFamilies, TemplateHaskell, QuasiQuotes, FlexibleInstances, StandaloneDeriving #-}
module DB where

import Database.PostgreSQL.Simple
import qualified Data.Text as T



data FieldMapTable = FieldMapTable {
    _fieldMapTableId :: Int64
  , _fieldMapTableField :: Int64
}

instance FromRow FieldMapTable where
  fromRow = FieldMapTable <$> field <*> field

data FieldTable = FieldTable {
    _fieldTableName :: T.Text
  , _fieldTableType :: Int64
}




