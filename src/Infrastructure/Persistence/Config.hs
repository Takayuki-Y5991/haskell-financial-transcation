module Infrastructure.Config where

import System.Environment (getEnv)
import Database.Persist.Postgresql (ConnectionPool, createPostgresqlPool)
import Control.Monad.Logger (runStderrLoggingT)

-- データベース接続設定の取得
getConnectionPool :: IO ConnectionPool
getConnectionPool = do
    connStr <- getEnv "DATABASE_URL"
    runStderrLoggingT $ createPostgresqlPool connStr 10
