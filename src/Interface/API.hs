module Interface.API where

import Servant
import Application.UserService (loginUser)
import Domain.Types (Login, LoginResponse)

type API = "login" :> ReqBody '[JSON] Login :> Post '[JSON] LoginResponse
      :<|> "logout" :> AuthProtect "jwt-auth" :> Post '[JSON] NoContent

server :: Server API
server = loginUserHandler :<|> logoutHandler

loginUserHandler :: Login -> Handler LoginResponse
loginUserHandler login = do
    result <- liftIO $ loginUser (loginUsername login) (loginPassword login)
    case result of
        Left err -> throwError err401 { errBody = err }
        Right res -> return res
