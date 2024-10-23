package hr.java.production.main;

import hr.java.restaurant.model.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Category[] categories = new Category[3];
        Category.inputCategory(categories, scanner);

        Ingredient[] ingredients = new Ingredient[5];
        Ingredient.inputIngredient(ingredients, categories, scanner);

        Meal[] meals = new Meal[3];
        Meal.inputMeal(meals, categories, ingredients, scanner);

        Chef[] chefs = new Chef[3];
        Chef.inputChef(chefs, scanner);

        Waiter[]  waiters = new Waiter[3];
        Waiter.inputWaiter(waiters, scanner);

        Deliverer[]  deliverers = new Deliverer[3];
        Deliverer.inputDeliverer(deliverers, scanner);

        Restaurant[] restaurants = new Restaurant[3];
        Restaurant.inputRestaurant(restaurants, meals, chefs, waiters, deliverers, scanner);

        Order[] orders = new Order[3];
        Order.inputOrder(orders, restaurants, meals, scanner);

        Order[] mostExpensiveOrders = Order.findMostExpensiveOrders(orders);

        for (int i = 0; i < mostExpensiveOrders.length; i++) {
            System.out.print("Najskuplja narudžba");
            if(mostExpensiveOrders.length > 1)
                System.out.println(" " + (i+1));
            else
                System.out.println(":");

            mostExpensiveOrders[i].print();
            System.out.println();
        }

        scanner.close();
    }
}


/*
Juha
Topla i kremasta jela od povrća ili mesa.
Salata
Svježe i zdrave miješane salate.
Tjestenina
Talijanska tjestenina s različitim umacima.
Mrkva
Voće
Juha
abcjelo
41
Kuhano
Rajčica
Salata
18.5
Svježe
Špageti
Tjestenina
158
Kuhano
Krumpir
Juha
77
Pečeno
Krastavac
Salata
16
Svježe
Juha od mrkve
Juha
-1
0
2
Mrkva
Krumpir
15
Špagete bolonjez
Tjestenina
1
Špageti
20
Salata od krastavca
Salata
1
Krastavac
18

Nikola
Jambrešić
1200
Luka
Vincelj
1300
Mateo
Spevec
1400

Julia
Janković
1500
Matija
Trstenjak
1400
Karlo
Puklek
1300

Matija
Puklek
1200
Natali
Kovačić
1200
Karlo
Kontrec
1300

McDonalds
Jarunska ulica
2
Zagreb
10000
2
Juha od mrkve
Salata od krastavca
2
Nikola Jambrešić
Luka Vincelj
2
Julia Janković
Matija Trstenjak
3
Matija Puklek
Natali Kovačić
Karlo Kontrec
Arka
Ulica Ivana Plemenitog Zajca
13
Čakovec
40000
1
Špagete bolonjez
1
Nikola Jambrešić
2
Julia Janković
Matija Trstenjak
Karlo Puklek
2
Matija Puklek
Karlo Kontrec
Laganini
Športska ulica
8
Čakovec
40000
2
Juha od mrkve
Špagete bolonjez
1
Matea Spevec
Julia Janković
Mateo Spevec
1
Karlo Puklek
1
Karlo Kontrec

Arka
1
Špagete bolonjez
Matija Puklek
2023-10-22T14:30:45
Arka
1
Špagete bolonjez
Matija Puklek
2023-11-11T11:32:35
McDonalds
2
Juha od mrkve
Salata od krastavca
Natali Kovačić
2023-11-17T23:32:31
*/