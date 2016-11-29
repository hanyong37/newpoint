::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "Q1GNLmReI81UUQHyTYsIP_Yk1baKPE9fe9kbXQej"
  config.qiniu_secret_key    = 'B6ivIbZFiWJiE1HBr2cEOdytqSCAvKUc0CAJ5BWQ'
  config.qiniu_bucket        = "xinjudian"
  config.qiniu_bucket_domain = "oh793la0t.bkt.clouddn.com"
  config.qiniu_bucket_private= false #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

  config.qiniu_styles = [:thumb, :large]
  #config.qiniu_up_host       = 'http://up.qiniug.com' #七牛上传海外服务器,国内使用可以不要这行配置
end
