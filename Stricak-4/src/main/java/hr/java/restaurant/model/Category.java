package hr.java.restaurant.model;

import hr.java.restaurant.exception.DuplicateEntryException;
import hr.java.service.Input;
import hr.java.service.Output;
import hr.java.service.Validation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Scanner;

/**
 * Represents a category of a meal.
 */
public class Category extends Entity {
    private static Long counter = 0L;
    private static final Logger logger = LoggerFactory.getLogger(Category.class);

    private String name;
    private String description;

    /**
     * Constructs a Category object using the provided builder.
     * @param builder the builder instance containing category information
     */
    private Category(Builder builder) {
        super(builder.id);
        this.name = builder.name;
        this.description = builder.description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * Checks if the category with the provided name already exists in the array of categories.
     * @param categories the categories
     * @param categoryName the name of the category
     * @return the index of the category if it exists, -1 otherwise
     */
    public static Integer existsByName(Category[] categories, String categoryName) {
        for (int j=0;j<categories.length;j++) {
            if (categoryName.equals(categories[j].getName())) {
                return j;
            }
        }
        return -1;
    }

    /**
     * Inputs the category information.
     * @param categories the categories
     * @param scanner the scanner object used for input
     */
    public static void inputCategory(Category[] categories, Scanner scanner) {
        logger.info("Category input");

        for(int i = 0; i < categories.length; i++) {
            String categoryName;

            while(true) {
                categoryName = Input.string(scanner, "Unesite naziv "+ (i+1) +". kategorije: ");

                try {
                    Validation.checkDuplicateCategory(categories, categoryName);
                    break;
                } catch (DuplicateEntryException e) {
                    System.out.println("Kategorija s tim nazivom već postoji. Molimo unesite drugi naziv.");
                }
            }

            String categoryDescription = Input.string(scanner, "Unesite opis  "+ (i+1) +". kategorije: ");

            categories[i] = new Builder()
                    .id(++counter)
                    .name(categoryName)
                    .description(categoryDescription)
                    .build();
        }
    }

    /**
     * Returns the names of the categories in the array.
     * @param categories the categories
     * @return the array of category names
     */
    public static String[] categoryNameArray(Category[] categories) {
        String[] categoryNames = new String[categories.length];

        for (int i = 0; i < categories.length; i++) {
            categoryNames[i] = categories[i].getName();
        }

        return categoryNames;
    }

    /**
     * Builder class for creating instances of {@link Category}.
     */
    public static class Builder {
        private Long id;
        private String name;
        private String description;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder description(String description) {
            this.description = description;
            return this;
        }

        public Category build() {
            return new Category(this)   ;
        }
    }

    /**
     * Prints the category details with the specified number of tabulators.
     * @param tabulators the number of tabulators to format the output
     */
    public void print(Integer tabulators) {
        logger.info("Printing category.");
        Output.tabulatorPrint(tabulators);
        System.out.println("Id: " + this.getId() + ", Naziv kategorije: " + this.name + ", Opis kategorije: "+ this.description);
    }
}