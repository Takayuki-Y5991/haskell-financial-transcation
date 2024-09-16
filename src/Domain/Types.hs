module Domain.Types where

import Data.Text (Text)

data Login = Login
    {
        loginUserName :: Text,
        loginPassword :: Text
    } deriving (Show)

data LoginResponse = LoginResponse
    {
        token :: Text
    } deriving (Show)
