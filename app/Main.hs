module Main(main) where

import Network.Wai.Handler.Warp (run)
import Infrastructure.Config (getConnectionPool)
import Servant.Auth.Server (generateKey, defaultJWTSettings)
import Interface.API (app)

main :: IO ()
main = do
    pool <- getConnectionPool
    jwtKey <- generateKey
    let jwtSettings = defaultJWTSettings jwtKey
    run 8080 $ app pool jwtSettings
