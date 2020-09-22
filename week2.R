#�ٱ�-�� �׸�
rivers
stem(rivers)
stem(rivers, scale=2)


#���� ��Ʈ
city <- c("����", "�λ�", "�뱸", "��õ", "����", "����", "���")
pm25 <- c(18, 21, 21, 17, 8, 11, 25)
colors <- c("red", "orange", "yellow", "green", "lightblue", "blue", "violet")

#�⺻ �ɼ� ����
pie(pm25, labels=city, col=colors, main="������ �ʹ̼����� ��")

#90������ �ð���� ����
pie(pm25, labels=city, col=colors, main="������ �ʹ̼����� ��", init.angle=90, clockwise=T)

#��밡���� �� �̸� ã��
colors()


#gdRdriver �ȷ�Ʈ �ǽ�
x <- rep(1, 12)
x
pie(x, labels=seq(1,12), col=rainbow(12))
pie(x, labels=seq(1,12), col=heat.colors(12))
pie(x, labels=seq(1,12), col=terrain.colors(12))
pie(x, labels=seq(1,12), col=topo.colors(12))
pie(x, labels=seq(1,12), col=cm.colors(12))

#RColorBrewer �ȷ�Ʈ �ǽ�
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

#�� ����
greens <- brewer.pal(7, 'Greens')
pct <- round(pm25/sum(pm25)*100, 0)
city_label <- paste(city, ", ", pct, "%", sep="")

pie(pm25, labels=city_label, col=greens, main="������ �ʹ̼����� ��",
init.angle=90, clockwise=T)

pie(pm25, labels=city_label, col=rainbow(length(pm25)), main="������ �ʹ̼����� ��", init.angle=90, clockwise=T)

#�� ��Ʈ
dept <- c("���� 1��", "���� 2��", "���� 3��", "���� 4��")
sales01 <- c(4, 12, 5, 8)
bp <- barplot(sales01, names.arg=dept, col=rainbow(length(dept)), main="�μ��� ���� ����(1�б�)",xlab="�μ�", ylab="���� ����(���)")
text(x=bp, y=sales01, pos=1)

# ���� �� ��Ʈ 
bp <- barplot(sales01, names.arg=dept, col=rainbow(length(dept)), main="�μ��� ���� ����(1�б�)",xlab="�μ�", ylab="���� ����(���)", horiz=T)

# ������ �� ��Ʈ
sales02 <- c(12, 8, 8, 4)
sales <- rbind(sales01, sales02)
sales

legend_lbl <- c("1�б�", "2�б�")
legend_lbl

barplot(sales, main="�μ��� ���� ����(1~2�б�)", 
        names.arg=dept, 
        xlab="�μ�", ylab="���� ����(���)", 
        col=c("green", "orange"), 
        legend.text=legend_lbl, 
        args.legend=list(x="top", ncol=2),
        ylim=c(0, 30))
