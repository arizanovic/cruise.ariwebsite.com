package model;

import java.util.Date;

public class Bank {

    public Bank(int id) {
        this.id = id;
    }

    private int id;
    private Double eur_sell;
    private Double eur_buy;
    private Double eur_mid;
    private Double usd_sell;
    private Double usd_buy;
    private Double usd_mid;
    private Double chf_sell;
    private Double chf_buy;
    private Double chf_mid;
    private Date date;

    public Bank(Double eur_sell, Double eur_buy, Double eur_mid, Double usd_sell, Double usd_buy, Double usd_mid, Double chf_sell, Double chf_buy, Double chf_mid, Date date) {
        this.eur_sell = eur_sell;
        this.eur_buy = eur_buy;
        this.eur_mid = eur_mid;
        this.usd_sell = usd_sell;
        this.usd_buy = usd_buy;
        this.usd_mid = usd_mid;
        this.chf_sell = chf_sell;
        this.chf_buy = chf_buy;
        this.chf_mid = chf_mid;
        this.date = date;
    }

    public Bank(int id, Double eur_sell, Double eur_buy, Double eur_mid, Double usd_sell, Double usd_buy, Double usd_mid, Double chf_sell, Double chf_buy, Double chf_mid, Date date) {
        this.id = id;
        this.eur_sell = eur_sell;
        this.eur_buy = eur_buy;
        this.eur_mid = eur_mid;
        this.usd_sell = usd_sell;
        this.usd_buy = usd_buy;
        this.usd_mid = usd_mid;
        this.chf_sell = chf_sell;
        this.chf_buy = chf_buy;
        this.chf_mid = chf_mid;
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Bank(Double eur_sell, Double eur_buy, Double eur_mid, Double usd_sell, Double usd_buy, Double usd_mid, Double chf_sell, Double chf_buy, Double chf_mid) {
        this.eur_sell = eur_sell;
        this.eur_buy = eur_buy;
        this.eur_mid = eur_mid;
        this.usd_sell = usd_sell;
        this.usd_buy = usd_buy;
        this.usd_mid = usd_mid;
        this.chf_sell = chf_sell;
        this.chf_buy = chf_buy;
        this.chf_mid = chf_mid;
    }

    public Bank(int id, Double eur_sell, Double eur_buy, Double eur_mid, Double usd_sell, Double usd_buy, Double usd_mid, Double chf_sell, Double chf_buy, Double chf_mid) {
        this.id = id;
        this.eur_sell = eur_sell;
        this.eur_buy = eur_buy;
        this.eur_mid = eur_mid;
        this.usd_sell = usd_sell;
        this.usd_buy = usd_buy;
        this.usd_mid = usd_mid;
        this.chf_sell = chf_sell;
        this.chf_buy = chf_buy;
        this.chf_mid = chf_mid;
    }

    public Bank() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getEur_sell() {
        return eur_sell;
    }

    public void setEur_sell(Double eur_sell) {
        this.eur_sell = eur_sell;
    }

    public Double getEur_buy() {
        return eur_buy;
    }

    public void setEur_buy(Double eur_buy) {
        this.eur_buy = eur_buy;
    }

    public Double getEur_mid() {
        return eur_mid;
    }

    public void setEur_mid(Double eur_mid) {
        this.eur_mid = eur_mid;
    }

    public Double getUsd_sell() {
        return usd_sell;
    }

    public void setUsd_sell(Double usd_sell) {
        this.usd_sell = usd_sell;
    }

    public Double getUsd_buy() {
        return usd_buy;
    }

    public void setUsd_buy(Double usd_buy) {
        this.usd_buy = usd_buy;
    }

    public Double getUsd_mid() {
        return usd_mid;
    }

    public void setUsd_mid(Double usd_mid) {
        this.usd_mid = usd_mid;
    }

    public Double getChf_sell() {
        return chf_sell;
    }

    public void setChf_sell(Double chf_sell) {
        this.chf_sell = chf_sell;
    }

    public Double getChf_buy() {
        return chf_buy;
    }

    public void setChf_buy(Double chf_buy) {
        this.chf_buy = chf_buy;
    }

    public Double getChf_mid() {
        return chf_mid;
    }

    public void setChf_mid(Double chf_mid) {
        this.chf_mid = chf_mid;
    }

}
