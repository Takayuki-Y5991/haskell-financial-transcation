module Application.Auth where

import Domain.User (User)
import Servant.Auth.Server (makeJWT, JWTSettings)
import Control.Monad.IO.Class (liftIO)

-- JWTトークン生成
generateToken :: User -> JWTSettings -> IO (Either String Text)
generateToken user jwtSettings = liftIO $ makeJWT user jwtSettings Nothing
