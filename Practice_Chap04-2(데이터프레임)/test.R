# 문제 1
제품 <- c("사과", "딸기", "수박")
제품

가격 <- c(1800, 1500, 3000)
가격

판매량 <- c(24, 38, 13)
판매량

df_frame <- data.frame(제품, 가격, 판매량)
df_frame

# 문제 2
avg1 <- mean(df_frame$가격)
avg2 <- mean(df_frame$판매량)
data.frame(avg1, avg2)
