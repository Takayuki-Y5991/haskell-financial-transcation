module Domain.User where

import Data.Text (Text)

data User = User
    {
        userId :: Int,
        userName :: Text,
        passwordHash :: Text
    } deriving (Show, Eq)
