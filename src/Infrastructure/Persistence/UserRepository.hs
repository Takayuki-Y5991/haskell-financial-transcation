module Infrastructure.Persistence.UserRepository where

import Database.Persist.Postgresql
import Domain.User
import Control.Monad.IO.Class (liftIO)

-- ユーザー名に基づくユーザーの検索
findUserByUsername :: Text -> IO (Maybe (Entity User))
findUserByUsername username = do
    -- DB操作でユーザーを検索
    runSqlPool $ selectFirst [UserUsername ==. username] []
