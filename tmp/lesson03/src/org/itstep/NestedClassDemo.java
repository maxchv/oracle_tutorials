package org.itstep;

public class NestedClassDemo {
    public static void main(String[] args) {
        // вложенный класс
        Circle.Point point = new Circle.Point(10, 20);
        // внутренний класс относится к экземпляру внешнего класса
        List lst = new List();
        List.Node node = lst.new Node();

        Circle c = new Circle(10, 20);
        String to = "LCD";
        Circle.Drawable d = c.getDrawable(to);
        to = "Print";
        d = c.getDrawable(to);

        DayOfWeek day;
        day = DayOfWeek.MONDAY;
        switch (day) {
            case MONDAY:
                break;
            default:
                break;
        }
        System.out.println(day.getString("ru"));
        day = DayOfWeek.TUESDAY;
        System.out.println(day.getString("en"));

        day = DayOfWeek.valueOf("MONDAY");
        System.out.println(day + " num: " + day.getNum());
        System.out.println("All enums:");
        for(DayOfWeek _d: DayOfWeek.values()) {
            System.out.println(_d.getString("ru"));
        }
    }
}

enum DayOfWeek {
    MONDAY(1),
    TUESDAY(2);

    final int num;

    DayOfWeek(int n) {
        num = n;
    }

    public int getNum() {
        return num;
    }

    String getString(String lang) {
        String name = "";
        if (lang.equalsIgnoreCase("ru")) {
            switch (num) {
                case 1:
                    name = "Понедельник";

                    break;
                case 2:
                    name = "Вторник";
                    break;
                default:
                    name = "Неизвестно";
                    break;
            }
        } else {
            switch (num) {
                case 1:
                    name = "Monday";
                    break;
                case 2:
                    name = "Tuesday";
                    break;
                default:
                    name = "Unknown";
                    break;
            }
        }
        return name;
    }

    @Override
    public String toString() {
        return getString("en");
    }
}

class List {
    int count;

    class Node {
        public Node() {
            List.this.count++;
        }
    }

    Node head;

    public List() {
        this.head = this.new Node();
    }
}

class Shape implements Circle.Drawable {

    @Override
    public void draw() {

    }
}

class Circle {
    private static String name;

    interface Drawable {
        void draw();
    }

    Drawable getDrawable(String to) {
        final int a = 10;
        Point center;
        //class DrawTo implements Drawable {
        //Drawable drawable = new Drawable() {
        return new Drawable() {
            @Override
            public void draw() {
                Circle.this.center = new Point(100, 100);
                System.out.println(a);
                System.out.println("Draw to " + to + " circle with center " + Circle.this.center);
            }
        };

        //to = "LCD";

        //return new DrawTo();
        //return drawable;
    }

    static class Point implements Drawable {
        private int x;
        private int y;

        public Point(int x, int y) {
            this.x = x;
            this.y = y;
            name = "test";
        }

        @Override
        public void draw() {

        }

        @Override
        public String toString() {
            return "Point{" +
                    "x=" + x +
                    ", y=" + y +
                    '}';
        }
    }

    Point center;

    Circle(int x, int y) {
        center = new Point(x, y);
        center.x = 10;
    }

}
