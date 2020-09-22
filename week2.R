#줄기-잎 그림
rivers
stem(rivers)
stem(rivers, scale=2)


#파이 차트
city <- c("서울", "부산", "대구", "인천", "광주", "대전", "울산")
pm25 <- c(18, 21, 21, 17, 8, 11, 25)
colors <- c("red", "orange", "yellow", "green", "lightblue", "blue", "violet")

#기본 옵션 실행
pie(pm25, labels=city, col=colors, main="지역별 초미세먼지 농도")

#90도에서 시계방향 실행
pie(pm25, labels=city, col=colors, main="지역별 초미세먼지 농도", init.angle=90, clockwise=T)

#사용가능한 색 이름 찾기
colors()


#gdRdriver 팔레트 실습
x <- rep(1, 12)
x
pie(x, labels=seq(1,12), col=rainbow(12))
pie(x, labels=seq(1,12), col=heat.colors(12))
pie(x, labels=seq(1,12), col=terrain.colors(12))
pie(x, labels=seq(1,12), col=topo.colors(12))
pie(x, labels=seq(1,12), col=cm.colors(12))

#RColorBrewer 팔레트 실습
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

#라벨 변경
greens <- brewer.pal(7, 'Greens')
pct <- round(pm25/sum(pm25)*100, 0)
city_label <- paste(city, ", ", pct, "%", sep="")

pie(pm25, labels=city_label, col=greens, main="지역별 초미세먼지 농도",
init.angle=90, clockwise=T)

pie(pm25, labels=city_label, col=rainbow(length(pm25)), main="지역별 초미세먼지 농도", init.angle=90, clockwise=T)

#바 차트
dept <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
sales01 <- c(4, 12, 5, 8)
bp <- barplot(sales01, names.arg=dept, col=rainbow(length(dept)), main="부서별 영업 실적(1분기)",xlab="부서", ylab="영업 실적(억원)")
text(x=bp, y=sales01, pos=1)

# 수평 바 차트 
bp <- barplot(sales01, names.arg=dept, col=rainbow(length(dept)), main="부서별 영업 실적(1분기)",xlab="부서", ylab="영업 실적(억원)", horiz=T)

# 스택형 바 차트
sales02 <- c(12, 8, 8, 4)
sales <- rbind(sales01, sales02)
sales

legend_lbl <- c("1분기", "2분기")
legend_lbl

barplot(sales, main="부서별 영업 실적(1~2분기)", 
        names.arg=dept, 
        xlab="부서", ylab="영업 실적(억원)", 
        col=c("green", "orange"), 
        legend.text=legend_lbl, 
        args.legend=list(x="top", ncol=2),
        ylim=c(0, 30))

