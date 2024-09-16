module Application.UserService where

import Domain.User
import Infrastructure.Persistence.UserRepository (findUserByUsername)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Reader (asks)
import Application.Auth (generateToken)

-- ユーザーのログイン処理
loginUser :: Text -> Text -> App (Either Text LoginResponse)
loginUser username password = do
    user <- liftIO $ findUserByUsername username
    case user of
        Nothing -> return $ Left "Invalid username or password"
        Just u -> if verifyPassword password (passwordHash u)
                  then do
                      jwt <- generateToken u jwtSettings
                      return $ Right $ LoginResponse { token = jwt }
                  else return $ Left "Invalid username or password"
